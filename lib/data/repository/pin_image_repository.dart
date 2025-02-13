import 'dart:io';
import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/image_entity.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_image_repository.g.dart';

class PinImageRepository extends CacheImpl<ImageEntity> {
  final Ref ref;

  PinImageRepository(super.boxName, {required this.ref, super.maxItems, super.ttlDuration});

  Future<String?> _getImagePath(String pinId) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/pin_image_$pinId.png';
  }

  Future<Uint8List?> offlineImage(String pinId) async {
    final cachedImage = await get(pinId);
    if (cachedImage?.filePath != null && File(cachedImage!.filePath).existsSync()) {
      return await File(cachedImage.filePath).readAsBytes();
    }
    return null;
  }

  Future<Uint8List> fetchImage(String pinId) async {
    final image = await offlineImage(pinId);
    if (image != null) {
      return image;
    }
    return await _fetchAndCacheImage(pinId);
  }

  Future<Uint8List> _fetchAndCacheImage(String pinId) async {
    try {
      final imageUrl = await ref.watch(pinApiProvider).getPinImage(pinId);
      final image = await http.get(Uri.parse(imageUrl!));
      final decodedImage = image.bodyBytes;
      final filePath = await _getImagePath(pinId);

      if (filePath != null) {
        await File(filePath).writeAsBytes(decodedImage);
        await put(pinId, ImageEntity(filePath: filePath));
      }

      return decodedImage;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addOfflineImage(String pinId, Uint8List image) async {
    final filePath = await _getImagePath(pinId);
    if (filePath != null) {
      await File(filePath).writeAsBytes(image);
      await put(pinId, ImageEntity(filePath: filePath, keepAlive: true));
    }
  }

  @override
  Future<void> delete(String id) async {
    final cachedImage = await get(id);
    if (cachedImage?.filePath != null) {
      final file = File(cachedImage!.filePath);
      if (file.existsSync()) {
        await file.delete();
      }
    }
    await super.delete(id);
  }

  @override
  Future<void> deleteAll() async {
    final allItems = await getAllAsMap();
    for (final item in allItems.keys) {
      await delete(item);
    }
  }
}

@Riverpod(keepAlive: true)
PinImageRepository pinImageRepository(Ref ref) {
  return PinImageRepository("pinImages", ref: ref, maxItems: 500, ttlDuration: const Duration(days: 180));
}
