import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/image_entity.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mutex/mutex.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_image_repository.g.dart';

class PinImageRepository extends CacheImpl<ImageEntity> {
  final Ref ref;
  final int maxCacheSize;
  final Map<String, Mutex> _mutexMap = {};

  PinImageRepository({required this.ref, required this.maxCacheSize}) : super("pinImages"); // Use the CacheImpl constructor

  @override
  Future<void> deleteOldestItems() async {
    final box = await openBox();
    final items = await getAllAsMap();
    final keys = items.keys.toList();
    for (int i = 0; i < (box.length - maxItems!); i++) {
      final key = keys[i];
      if (items[key]?.keepAlive == false) {
        await box.delete(key);
      }
    }
  }

  Future<Uint8List> fetchImage(String pinId) async {
    final mutex = _mutexMap.putIfAbsent(pinId, () => Mutex());
    return await mutex.protect(() async {
      final cachedImage = await get(pinId); // Use the get method from CacheImpl
      if (cachedImage != null) {
        return cachedImage.blob1!;
      }
      return await _fetchAndCacheImage(pinId);
    });
  }

  // Fetch the image from the API and cache it
  Future<Uint8List> _fetchAndCacheImage(String pinId) async {
    try {
      final imageUrl = await ref.watch(pinApiProvider).getPinImage(pinId);
      final image = await http.get(Uri.parse(imageUrl!));
      final decodedImage = image.bodyBytes;

      await put(pinId, ImageEntity(
        blob1: decodedImage,
        ttl: DateTime.now().add(Duration(days: 180)),
        keepAlive: false,
      ));
      return decodedImage;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addOfflineImage(String pinId, Uint8List image) async {
    await put(pinId, ImageEntity(
      blob1: image,
      ttl: DateTime.now().add(Duration(days: 180)),
      keepAlive: true,
    ));
  }


}

@Riverpod(keepAlive: true)
PinImageRepository pinImageRepository(Ref ref) {
  return PinImageRepository(ref: ref, maxCacheSize: 1000);
}
