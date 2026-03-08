import 'dart:io';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/image_entity.dart';
import 'package:buff_lisa/data/repository/isar_repo.dart';
import 'package:buff_lisa/util/core/cache_api.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:buff_lisa/util/core/fast_hash.dart';
import 'package:buff_lisa/util/core/in_memory_cache_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_repository.g.dart';

abstract class IImageRepository implements CacheApi<ImageEntity> {
  ImageType get type;
  Future<Uint8List?> fetchImage(String id, bool keepAlive);
  Stream<Uint8List?> watchImageBytes(String id);
  Future<Uint8List> overrideUrl(String id, String url, bool keepAlive);
  Future<void> addImage(String id, Uint8List image, bool keepAlive);
}

class ImageRepository extends CacheImpl<ImageEntity> implements IImageRepository {
  ImageRepository({
    required super.box,
    required super.isar,
    required this.getImageUrl,
    required this.urlFileName,
    required this.urlSubFolder,
    required this.type,
    super.maxItems,
    super.ttlDuration,
  });

  final Map<String, Future<Uint8List?>> _activeRequests = {};
  final String urlFileName;
  final String urlSubFolder;
  final Future<String?> Function(String) getImageUrl;
  @override
  final ImageType type;

  Future<String?> _getImagePath(String id) async {
    final directory = await getApplicationDocumentsDirectory();
    // Add type.name to path to avoid file name collisions
    return '${directory.path}/${urlSubFolder}_${type.name}_${id}_$urlFileName';
  }

  @override
  Future<Uint8List?> fetchImage(String id, bool keepAlive) async {
    final isarId = fastHash('${type.name}_$id');
    final cachedImage = await box.get(isarId);
    
    if (cachedImage?.isEmpty == true) {
      return null;
    } else if (cachedImage?.filePath != null && await File(cachedImage!.filePath).exists()) {
      return await File(cachedImage.filePath).readAsBytes();
    }

    // ADD THIS: Check if a request for this ID is already running
    if (_activeRequests.containsKey(id)) {
      return _activeRequests[id]; // Return the ongoing Future
    }

    // ADD THIS: Create the Future, store it, await it, and then clean up
    final requestFuture = _fetchAndCacheImage(id, keepAlive);
    _activeRequests[id] = requestFuture;

    try {
      return await requestFuture;
    } finally {
      // Ensure the request is removed from the map whether it succeeds or fails
      _activeRequests.remove(id);
    }
  }

  @override
  Stream<Uint8List?> watchImageBytes(String id) {
    final isarId = fastHash('${type.name}_$id');
    return box.watchObject(isarId, fireImmediately: true).asBroadcastStream().asyncMap((entity) async {
      if (entity == null || entity.isEmpty) {
        return null;
      }
      if (entity.filePath.isNotEmpty) {
        final file = File(entity.filePath);
        if (await file.exists()) {
          return await file.readAsBytes();
        }
      }
      return null; 
    });
  }

  @override
  Future<Uint8List> overrideUrl(String id, String url, bool keepAlive) async {
    try {
      final image = await http.get(Uri.parse(url));
      final filePath = await _getImagePath(id);
      if (filePath != null) {
        await File(filePath).writeAsBytes(image.bodyBytes);
        if (keepAlive) {
          // 3. Include type in all entity creations
          await put(ImageEntity(id: id, type: type, filePath: filePath, keepAlive: keepAlive, ttl: DateTime.now(), onlySession: false));
        }
      }
      return image.bodyBytes;
    } catch (e) {
      rethrow;
    }
  }

  Future<Uint8List?> _fetchAndCacheImage(String id, bool keepAlive) async {
    try {
      final imageUrl = await getImageUrl(id);
      
      if (imageUrl == null) {
        await put(ImageEntity(id: id, type: type, filePath: "", isEmpty: true, keepAlive: keepAlive, ttl: DateTime.now(), onlySession: false));
        return null;
      }
      final image = await http.get(Uri.parse(imageUrl));
      final filePath = await _getImagePath(id);

      if (filePath != null) {
        await File(filePath).writeAsBytes(image.bodyBytes);
        await put(ImageEntity(id: id, type: type, filePath: filePath, keepAlive: keepAlive, ttl: DateTime.now(), onlySession: false));
      }

      return image.bodyBytes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addImage(String id, Uint8List image, bool keepAlive) async {
    final filePath = await _getImagePath(id);
    if (filePath != null) {
      await File(filePath).writeAsBytes(image);
      await put(ImageEntity(id: id, type: type, filePath: filePath, keepAlive: keepAlive, ttl: DateTime.now(), onlySession: false));
    }
  }

  @override
  Future<void> delete(String id) async {
    await isar.writeTxn(() async {
      final isarId = fastHash('${type.name}_$id');
      final cachedImage = await box.get(isarId);
      if (cachedImage?.filePath != null) {
        final file = File(cachedImage!.filePath);
        if (await file.exists()) {
          await file.delete();
        }
      }
      await box.delete(isarId);
    });
  }

  @override
  Future<void> deleteAll() async {
    await isar.writeTxn(() async => await box.filter().typeEqualTo(type).deleteAll());
  }
}



class ImageRepositoryWeb extends InMemoryCache<ImageEntity> implements IImageRepository {
  final Future<String?> Function(String) getImageUrl;
  @override
  final ImageType type;
  final Map<String, Uint8List> _bytesCache = {};
  final Map<String, Future<Uint8List?>> _activeRequests = {};

  ImageRepositoryWeb({
    required this.getImageUrl,
    required this.type,
    super.maxItems,
    super.ttlDuration,
  });

@override
  Future<Uint8List?> fetchImage(String id, bool keepAlive) async {
    final cachedEntity = await get(id);
    
    if (cachedEntity?.isEmpty == true) {
      return null;
    } else if (_bytesCache.containsKey(id)) {
      // Pre-emptively load into Flutter's image cache for instant UI rendering
      _precacheInFlutter(id);
      return _bytesCache[id];
    }
    
    // ADD THIS: Check if a request for this ID is already running
    if (_activeRequests.containsKey(id)) {
      return _activeRequests[id]; // Return the ongoing Future
    }

    // ADD THIS: Create the Future, store it, await it, and then clean up
    final requestFuture = _fetchAndCacheImage(id, keepAlive);
    _activeRequests[id] = requestFuture;

    try {
      return await requestFuture;
    } finally {
      _activeRequests.remove(id);
    }
  }

  @override
  Stream<Uint8List?> watchImageBytes(String id) {
    return cacheChanges.map((_) => _bytesCache[id]);
  }

  @override
  Future<Uint8List> overrideUrl(String id, String url, bool keepAlive) async {
    final image = await http.get(Uri.parse(url));
    
    _evictFromFlutterCache(id); // Evict old image if it exists
    _bytesCache[id] = image.bodyBytes;
    
    if (keepAlive) {
      await put(ImageEntity(id: id, type: type, filePath: "", keepAlive: keepAlive, ttl: DateTime.now(), onlySession: false));
    }
    return image.bodyBytes;
  }

  Future<Uint8List?> _fetchAndCacheImage(String id, bool keepAlive) async {
    final imageUrl = await getImageUrl(id);
    if (imageUrl == null) {
      await put(ImageEntity(id: id, type: type, filePath: "", isEmpty: true, keepAlive: keepAlive, ttl: DateTime.now(), onlySession: false));
      return null;
    }

    final image = await http.get(Uri.parse(imageUrl));
    
    _bytesCache[id] = image.bodyBytes;
    await put(ImageEntity(id: id, type: type, filePath: "", keepAlive: keepAlive, ttl: DateTime.now(), onlySession: false));
    
    return image.bodyBytes;
  }

  @override
  Future<void> addImage(String id, Uint8List image, bool keepAlive) async {
    _evictFromFlutterCache(id);
    
    _bytesCache[id] = image;
    await put(ImageEntity(id: id, type: type, filePath: "", keepAlive: keepAlive, ttl: DateTime.now(), onlySession: false));
  }

  @override
  Future<void> delete(String id) async {
    _evictFromFlutterCache(id);
    _bytesCache.remove(id);
    await super.delete(id);
  }

  @override
  Future<void> deleteOldestItems() async {
    // Override to ensure when TTL drops an item, we also drop the bytes & evict
    final sizeBefore = cache.length;
    await super.deleteOldestItems();
    
    if (sizeBefore != cache.length) {
      // Find which keys are no longer in the entity cache and clean them up
      final keysToRemove = _bytesCache.keys.where((k) => !cache.containsKey(fastHash(k))).toList();
      for (final key in keysToRemove) {
        _evictFromFlutterCache(key);
        _bytesCache.remove(key);
      }
    }
  }

  @override
  Future<void> deleteAll() async {
    for (final key in _bytesCache.keys) {
      _evictFromFlutterCache(key);
    }
    _bytesCache.clear();
    await super.deleteAll();
  }

  void _evictFromFlutterCache(String id) {
    if (_bytesCache.containsKey(id)) {
      MemoryImage(_bytesCache[id]!).evict();
    }
  }

  void _precacheInFlutter(String id) {
    if (_bytesCache.containsKey(id)) {
      MemoryImage(_bytesCache[id]!).resolve(ImageConfiguration.empty);
    }
  }
}

// --- PROVIDERS ---

@Riverpod(keepAlive: true)
IImageRepository groupProfileRepo(Ref ref) {
  if (kIsWeb) {
    return ImageRepositoryWeb(
      type: ImageType.group,
      getImageUrl: ref.watch(groupApiProvider).getGroupProfileImage, 
      maxItems: 20
    );
  } else {
    final isar = ref.watch(isarRepoProvider);
    return ImageRepository(
      isar: isar,
      box: isar.imageEntitys,
      type: ImageType.group,
      getImageUrl: ref.watch(groupApiProvider).getGroupProfileImage, 
      urlSubFolder: "groups", 
      urlFileName: "group_profile.png", 
      maxItems: 20
    );
  }
}

@Riverpod(keepAlive: true)
IImageRepository groupProfileSmallRepo(Ref ref) {
  if (kIsWeb) {
    return ImageRepositoryWeb(
      type: ImageType.groupSmall,
      getImageUrl: ref.watch(groupApiProvider).getGroupProfileImageSmall,
      maxItems: 500,
    );
  }
  
  final isar = ref.watch(isarRepoProvider);
  return ImageRepository(
    isar: isar,
    box: isar.imageEntitys,
    type: ImageType.groupSmall,
    getImageUrl: ref.watch(groupApiProvider).getGroupProfileImageSmall,
    urlSubFolder: "groups",
    urlFileName: "group_profile_small.png",
    maxItems: 500,
  );
}

@Riverpod(keepAlive: true)
IImageRepository groupPinImageRepo(Ref ref) {
  if (kIsWeb) {
    return ImageRepositoryWeb(
      type: ImageType.groupPin,
      getImageUrl: ref.watch(groupApiProvider).getGroupPinImage,
      maxItems: 50,
    );
  }
  
  final isar = ref.watch(isarRepoProvider);
  return ImageRepository(
    isar: isar,
    box: isar.imageEntitys,
    type: ImageType.groupPin,
    getImageUrl: ref.watch(groupApiProvider).getGroupPinImage,
    urlSubFolder: "groups",
    urlFileName: "group_pin.png",
    maxItems: 50,
  );
}

@Riverpod(keepAlive: true)
IImageRepository userImageSmallRepo(Ref ref) {
  if (kIsWeb) {
    return ImageRepositoryWeb(
      type: ImageType.userSmall,
      getImageUrl: ref.watch(userApiProvider).getUserProfileImageSmall,
      maxItems: 500,
    );
  }
  
  final isar = ref.watch(isarRepoProvider);
  return ImageRepository(
    isar: isar,
    box: isar.imageEntitys,
    type: ImageType.userSmall,
    getImageUrl: ref.watch(userApiProvider).getUserProfileImageSmall,
    urlSubFolder: "users",
    urlFileName: "profile_small.png",
    maxItems: 500,
  );
}

@Riverpod(keepAlive: true)
IImageRepository userImageRepo(Ref ref) {
  if (kIsWeb) {
    return ImageRepositoryWeb(
      type: ImageType.user,
      getImageUrl: ref.watch(userApiProvider).getUserProfileImage,
      maxItems: 50,
    );
  }
  
  final isar = ref.watch(isarRepoProvider);
  return ImageRepository(
    isar: isar,
    box: isar.imageEntitys,
    type: ImageType.user,
    getImageUrl: ref.watch(userApiProvider).getUserProfileImage,
    urlSubFolder: "users",
    urlFileName: "profile.png",
    maxItems: 50,
  );
}

@Riverpod(keepAlive: true)
IImageRepository pinImageRepository(Ref ref) {
  if (kIsWeb) {
    return ImageRepositoryWeb(
      type: ImageType.pin,
      getImageUrl: ref.watch(pinApiProvider).getPinImage,
      maxItems: 200,
    );
  }
  
  final isar = ref.watch(isarRepoProvider);
  return ImageRepository(
    isar: isar,
    box: isar.imageEntitys,
    type: ImageType.pin,
    getImageUrl: ref.watch(pinApiProvider).getPinImage,
    urlSubFolder: "pins",
    urlFileName: "pin.png",
    maxItems: 200,
  );
}
