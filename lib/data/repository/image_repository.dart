import 'dart:io';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/database/database.dart';
import 'package:buff_lisa/data/entity/image_entity.dart';
import 'package:buff_lisa/data/repository/drift_repo.dart';
import 'package:buff_lisa/util/core/cache_api.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:buff_lisa/util/core/fast_hash.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
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
  final AppDatabase db;
  final Future<String?> Function(String) getImageUrl;
  final String urlFileName;
  final String urlSubFolder;
  @override
  final ImageType type;

  final Map<String, Future<Uint8List?>> _activeRequests = {};
  final Map<String, Uint8List> _webBytesCache = {};

  ImageRepository({
    required this.db,
    required this.getImageUrl,
    required this.urlFileName,
    required this.urlSubFolder,
    required this.type,
    super.maxItems,
    super.ttlDuration,
  });

  ImageEntitiesCompanion _toCompanion(ImageEntity entity) {
    return ImageEntitiesCompanion(
      id: Value(entity.id),
      type: Value(entity.type),
      filePath: Value(entity.filePath),
      isEmptyVal: Value(entity.isEmpty),
      isarId: Value(entity.isarId),
      ttl: Value(entity.ttl),
      hits: Value(entity.hits),
      keepAlive: Value(entity.keepAlive),
      onlySession: Value(entity.onlySession),
    );
  }

  ImageEntity _fromDb(ImageDb data) {
    return ImageEntity(
      id: data.id,
      type: data.type,
      filePath: data.filePath,
      isEmpty: data.isEmptyVal,
      keepAlive: data.keepAlive,
      hits: data.hits,
      ttl: data.ttl,
      onlySession: data.onlySession,
    );
  }

  @override
  Future<void> doDelete(int isarId) async {
    final cachedImage = await doGet(isarId);
    if (cachedImage?.filePath != null && cachedImage!.filePath.isNotEmpty) {
      if (!kIsWeb) {
        final file = File(cachedImage.filePath);
        if (await file.exists()) {
          await file.delete();
        }
      } else {
        _webBytesCache.remove(cachedImage.id);
      }
    }
    await (db.delete(db.imageEntities)..where((tbl) => tbl.isarId.equals(isarId))).go();
  }

  @override
  Future<void> doDeleteAll() async {
    final items = await doGetAll();
    for (final item in items) {
      if (item.filePath.isNotEmpty) {
        if (!kIsWeb) {
          final file = File(item.filePath);
          if (await file.exists()) {
            await file.delete();
          }
        }
      }
    }
    _webBytesCache.clear();
    await (db.delete(db.imageEntities)..where((tbl) => tbl.type.equalsValue(type))).go();
  }

  @override
  Future<void> doDeleteMultiple(List<int> isarIds) async {
    for (final id in isarIds) {
      await doDelete(id);
    }
  }

  @override
  Future<ImageEntity?> doGet(int isarId) async {
    final res = await (db.select(db.imageEntities)..where((tbl) => tbl.isarId.equals(isarId))).getSingleOrNull();
    return res == null ? null : _fromDb(res);
  }

  @override
  Future<List<ImageEntity>> doGetAll() async {
    final res = await (db.select(db.imageEntities)..where((tbl) => tbl.type.equalsValue(type))).get();
    return res.map(_fromDb).toList();
  }

  @override
  Future<List<ImageEntity>> doGetList(List<int> isarIds) async {
    final res = await (db.select(db.imageEntities)..where((tbl) => tbl.isarId.isIn(isarIds))).get();
    return res.map(_fromDb).toList();
  }

  @override
  Future<int> doGetSize() async {
    final countExp = db.imageEntities.isarId.count();
    final query = db.selectOnly(db.imageEntities)..where(db.imageEntities.type.equalsValue(type))..addColumns([countExp]);
    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }

  @override
  Future<List<ImageEntity>> doGetSortedByHits() async {
    final res = await (db.select(db.imageEntities)..where((tbl) => tbl.type.equalsValue(type))..orderBy([(t) => OrderingTerm(expression: t.hits, mode: OrderingMode.asc)])).get();
    return res.map(_fromDb).toList();
  }

  @override
  Future<void> doPut(ImageEntity item) async {
    await db.into(db.imageEntities).insertOnConflictUpdate(_toCompanion(item));
  }

  @override
  Future<void> doPutMultiple(List<ImageEntity> items) async {
    await db.batch((batch) {
      batch.insertAllOnConflictUpdate(db.imageEntities, items.map(_toCompanion).toList());
    });
  }

  @override
  Stream<ImageEntity?> doWatchById(int isarId) {
    return (db.select(db.imageEntities)..where((tbl) => tbl.isarId.equals(isarId))).watchSingleOrNull().map((res) => res == null ? null : _fromDb(res));
  }

  Future<String?> _getImagePath(String id) async {
    if (kIsWeb) return ""; // No local files on web
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/${urlSubFolder}_${type.name}_${id}_$urlFileName';
  }

  @override
  Future<Uint8List?> fetchImage(String id, bool keepAlive) async {
    final isarId = fastHash('${type.name}_$id');
    final cachedImage = await doGet(isarId);
    
    if (cachedImage?.isEmpty == true) {
      return null;
    } else if (cachedImage?.filePath != null && cachedImage!.filePath.isNotEmpty) {
      if (!kIsWeb) {
        final file = File(cachedImage.filePath);
        if (await file.exists()) {
          return await file.readAsBytes();
        }
      } else if (_webBytesCache.containsKey(id)) {
        return _webBytesCache[id];
      }
    }

    if (_activeRequests.containsKey(id)) {
      return _activeRequests[id];
    }

    final requestFuture = _fetchAndCacheImage(id, keepAlive);
    _activeRequests[id] = requestFuture;

    try {
      return await requestFuture;
    } finally {
      _activeRequests.remove(id);
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

      if (filePath != null && filePath.isNotEmpty) {
        if (!kIsWeb) {
          await File(filePath).writeAsBytes(image.bodyBytes);
        } else {
          _webBytesCache[id] = image.bodyBytes;
        }
        await put(ImageEntity(id: id, type: type, filePath: filePath, keepAlive: keepAlive, ttl: DateTime.now(), onlySession: false));
      }

      return image.bodyBytes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<Uint8List?> watchImageBytes(String id) {
    return doWatchById(fastHash('${type.name}_$id')).asyncMap((entity) async {
      if (entity == null || entity.isEmpty) {
        return null;
      }
      if (entity.filePath.isNotEmpty) {
        if (!kIsWeb) {
          final file = File(entity.filePath);
          if (await file.exists()) {
            return await file.readAsBytes();
          }
        } else {
          return _webBytesCache[id];
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
        if (!kIsWeb && filePath.isNotEmpty) {
          await File(filePath).writeAsBytes(image.bodyBytes);
        } else if (kIsWeb) {
          _webBytesCache[id] = image.bodyBytes;
        }
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
      if (!kIsWeb && filePath.isNotEmpty) {
        await File(filePath).writeAsBytes(image);
      } else if (kIsWeb) {
        _webBytesCache[id] = image;
      }
      await put(ImageEntity(id: id, type: type, filePath: filePath, keepAlive: keepAlive, ttl: DateTime.now(), onlySession: false));
    }
  }
}

// --- PROVIDERS ---

@Riverpod(keepAlive: true)
IImageRepository groupProfileRepo(Ref ref) {
  return ImageRepository(
    db: ref.watch(driftRepoProvider),
    type: ImageType.group,
    getImageUrl: ref.watch(groupApiProvider).getGroupProfileImage, 
    urlSubFolder: "groups", 
    urlFileName: "group_profile.png", 
    maxItems: 20
  );
}

@Riverpod(keepAlive: true)
IImageRepository groupProfileSmallRepo(Ref ref) {
  return ImageRepository(
    db: ref.watch(driftRepoProvider),
    type: ImageType.groupSmall,
    getImageUrl: ref.watch(groupApiProvider).getGroupProfileImageSmall,
    urlSubFolder: "groups",
    urlFileName: "group_profile_small.png",
    maxItems: 500,
  );
}

@Riverpod(keepAlive: true)
IImageRepository groupPinImageRepo(Ref ref) {
  return ImageRepository(
    db: ref.watch(driftRepoProvider),
    type: ImageType.groupPin,
    getImageUrl: ref.watch(groupApiProvider).getGroupPinImage,
    urlSubFolder: "groups",
    urlFileName: "group_pin.png",
    maxItems: 50,
  );
}

@Riverpod(keepAlive: true)
IImageRepository userImageSmallRepo(Ref ref) {
  return ImageRepository(
    db: ref.watch(driftRepoProvider),
    type: ImageType.userSmall,
    getImageUrl: ref.watch(userApiProvider).getUserProfileImageSmall,
    urlSubFolder: "users",
    urlFileName: "profile_small.png",
    maxItems: 500,
  );
}

@Riverpod(keepAlive: true)
IImageRepository userImageRepo(Ref ref) {
  return ImageRepository(
    db: ref.watch(driftRepoProvider),
    type: ImageType.user,
    getImageUrl: ref.watch(userApiProvider).getUserProfileImage,
    urlSubFolder: "users",
    urlFileName: "profile.png",
    maxItems: 50,
  );
}

@Riverpod(keepAlive: true)
IImageRepository pinImageRepository(Ref ref) {
  return ImageRepository(
    db: ref.watch(driftRepoProvider),
    type: ImageType.pin,
    getImageUrl: ref.watch(pinApiProvider).getPinImage,
    urlSubFolder: "pins",
    urlFileName: "pin.png",
    maxItems: 200,
  );
}
