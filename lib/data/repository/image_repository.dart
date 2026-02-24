import 'dart:io';
import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/image_entity.dart';
import 'package:buff_lisa/data/repository/isar_repo.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:buff_lisa/util/core/fast_hash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_repository.g.dart';

class ImageRepository extends CacheImpl<ImageEntity> {
  ImageRepository({
    required super.box,
    required super.isar,
    required this.getImageUrl,
    required this.urlFileName,
    required this.urlSubFolder,
    required this.type, // 1. Require the type
    super.maxItems,
    super.ttlDuration,
  });

  final String urlFileName;
  final String urlSubFolder;
  final Future<String?> Function(String) getImageUrl;
  final ImageType type; // 2. Store the type

  Future<String?> _getImagePath(String id) async {
    final directory = await getApplicationDocumentsDirectory();
    // Add type.name to path to avoid file name collisions
    return '${directory.path}/${urlSubFolder}_${type.name}_${id}_$urlFileName';
  }

  Future<Uint8List?> fetchImage(String id, bool keepAlive) async {
    final isarId = fastHash('${type.name}_$id');
    final cachedImage = await box.get(isarId);
    if (cachedImage?.isEmpty == true) {
      return null;
    }
    else if (cachedImage?.filePath != null && await File(cachedImage!.filePath).exists()) {
      return await File(cachedImage.filePath).readAsBytes();
    }
    return await _fetchAndCacheImage(id, keepAlive);
  }

  Stream<Uint8List?> watchImageBytes(String id) {
    final isarId = fastHash('${type.name}_$id');
    return box.watchObject(isarId, fireImmediately: true).asyncMap((entity) async {
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

  Future<void> addImage(String id, Uint8List image, bool keepAlive) async {
    final filePath = await _getImagePath(id);
    if (filePath != null) {
      await File(filePath).writeAsBytes(image);
      await put(ImageEntity(id: id, type: type, filePath: filePath, keepAlive: keepAlive, ttl: DateTime.now(), onlySession: false));
    }
  }

  @override
  Future<void> delete(String id) async {
    final isarId = fastHash('${type.name}_$id');
    final cachedImage = await box.get(isarId);
    if (cachedImage?.filePath != null) {
      final file = File(cachedImage!.filePath);
      if (await file.exists()) {
        await file.delete();
      }
    }
    await box.delete(isarId);
  }

  @override
  Future<void> deleteAll() async {
    await isar.writeTxn(() async => await box.filter().typeEqualTo(type).deleteAll());
  }
}

// --- PROVIDERS ---

@Riverpod(keepAlive: true)
ImageRepository groupProfileRepo(Ref ref) {
  final isar = ref.watch(isarRepoProvider);
  return ImageRepository(
    isar: isar,
    box: isar.imageEntitys, // All point to the same box now
    type: ImageType.group, // Pass the explicit type
    getImageUrl: ref.watch(groupApiProvider).getGroupProfileImage, urlSubFolder: "groups", urlFileName: "group_profile.png", maxItems: 20
  );
}

@Riverpod(keepAlive: true)
ImageRepository groupProfileSmallRepo(Ref ref) {
  final isar = ref.watch(isarRepoProvider);
  return ImageRepository(
    isar: isar,
    box: isar.imageEntitys,
    type: ImageType.groupSmall,
    getImageUrl: ref.watch(groupApiProvider).getGroupProfileImageSmall, urlSubFolder: "groups", urlFileName: "group_profile_small.png", maxItems: 500);
}

@Riverpod(keepAlive: true)
ImageRepository groupPinImageRepo(Ref ref) {
  final isar = ref.watch(isarRepoProvider);
  return ImageRepository(
    isar: isar,
    box: isar.imageEntitys,
    type: ImageType.groupPin,
    getImageUrl: ref.watch(groupApiProvider).getGroupPinImage, urlSubFolder: "groups", urlFileName: "group_pin.png", maxItems: 50);
}

@Riverpod(keepAlive: true)
ImageRepository userImageSmallRepo(Ref ref) {
  final isar = ref.watch(isarRepoProvider);
  return ImageRepository(
    isar: isar,
    box: isar.imageEntitys,
    type: ImageType.userSmall,
    getImageUrl: ref.watch(userApiProvider).getUserProfileImageSmall, urlSubFolder: "users", urlFileName: "profile_small.png", maxItems: 500);
}

@Riverpod(keepAlive: true)
ImageRepository userImageRepo(Ref ref) {
  final isar = ref.watch(isarRepoProvider);
  return ImageRepository(
    isar: isar,
    box: isar.imageEntitys,
    type: ImageType.user,
    getImageUrl: ref.watch(userApiProvider).getUserProfileImage, urlSubFolder: "users", urlFileName: "profile.png", maxItems: 50);
}

@Riverpod(keepAlive: true)
ImageRepository pinImageRepository(Ref ref) {
  final isar = ref.watch(isarRepoProvider);
  return ImageRepository(
    isar: isar,
    box: isar.imageEntitys,
    type: ImageType.pin,
    getImageUrl: ref.watch(pinApiProvider).getPinImage, urlSubFolder: "pins", urlFileName: "pin.png", maxItems: 200);
}
