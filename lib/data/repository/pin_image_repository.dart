import 'dart:io';
import 'dart:isolate';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/image_entity.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_image_repository.g.dart';

class PinImageRepository extends CacheImpl<ImageEntity> {
  final Ref ref;

  PinImageRepository(super.boxName, {required this.ref, super.maxItems, super.ttlDuration});

  /// Get the image file path for a given pin ID
  Future<String?> _getImagePath(String pinId) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/pin_image_$pinId.png';
  }

  /// Load an offline image
  Future<Uint8List?> offlineImage(String pinId) async {
    final cachedImage = await get(pinId);
    if (cachedImage?.filePath != null && File(cachedImage!.filePath).existsSync()) {
      return await File(cachedImage.filePath).readAsBytes();
    }
    return null;
  }

  /// Fetch image (first tries offline, then downloads if necessary)
  Future<Uint8List> fetchImage(String pinId) async {
    final image = await offlineImage(pinId);
    if (image != null) return image;
    return await _fetchAndCacheImage(pinId);
  }

  /// Fetch and cache an image
  Future<Uint8List> _fetchAndCacheImage(String pinId) async {
    try {
      final imageUrl = await ref.watch(pinApiProvider).getPinImage(pinId);
      final image = await http.get(Uri.parse(imageUrl!));
      final decodedImage = image.bodyBytes;
      final filePath = await _getImagePath(pinId);

      if (filePath != null) {
        _saveImageInIsolate(filePath, decodedImage);
        put(pinId, ImageEntity(filePath: filePath));
      }

      return decodedImage;
    } catch (e) {
      rethrow;
    }
  }

  /// Add an offline image (Runs in an isolate)
  Future<void> addOfflineImage(String pinId, Uint8List image) async {
    final filePath = await _getImagePath(pinId);
    if (filePath != null) {
      await _saveImageInIsolate(filePath, image);
      await put(pinId, ImageEntity(filePath: filePath, keepAlive: true));
    }
  }

  @override
  Future<void> delete(String id) async {
    final cachedImage = await get(id);
    if (cachedImage?.filePath != null) {
      final file = File(cachedImage!.filePath);
      if (await file.exists()) {
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

  /// Save image using an isolate
  Future<void> _saveImageInIsolate(String filePath, Uint8List imageData) async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_saveFile, [filePath, imageData, receivePort.sendPort]);
    await receivePort.first; // Wait for completion
  }
}

/// Helper function to save files in an isolate
Future<void> _saveFile(List<dynamic> args) async {
  final String filePath = args[0] as String;
  final Uint8List imageData = args[1] as Uint8List;
  final SendPort sendPort = args[2] as SendPort;

  await File(filePath).writeAsBytes(imageData);
  sendPort.send(true);
}

@Riverpod(keepAlive: true)
PinImageRepository pinImageRepository(Ref ref) {
  return PinImageRepository("pinImages", ref: ref, maxItems: 500, ttlDuration: const Duration(days: 180));
}
