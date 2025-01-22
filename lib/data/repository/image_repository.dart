
import 'dart:typed_data';
import 'package:buff_lisa/data/entity/image_entity.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../service/global_data_service.dart';

part 'image_repository.g.dart';

class ImageRepository extends CacheImpl<ImageEntity> {
  ImageRepository(super.boxName, {
    required this.ref,
    required this.urlFileName,
    required this.urlSubFolder,
    super.maxItems,
    super.ttlDuration = const Duration(days: 1)
  });

  final String urlFileName;
  final String urlSubFolder;
  final Ref ref;

  Future<Uint8List> fetchImage(String id, bool keepAlive) async {
    final cachedImage = await get(id);
    if (cachedImage != null) {
      return cachedImage.blob1!;
    }
    return await _fetchAndCacheImage(id, keepAlive);
  }

  Future<Uint8List> overrideUrl(String id, String url, bool keepAlive) async {
    try {
      final image = await http.get(Uri.parse(url));
      if (keepAlive) {
        await put(id, ImageEntity(blob1: image.bodyBytes, keepAlive: keepAlive));
      }
      return image.bodyBytes;
    } catch (e) {
      rethrow;
    }
  }



  // Fetch the image from the API and cache it
  Future<Uint8List> _fetchAndCacheImage(String id, bool keepAlive) async {
    try {
      final global = ref.watch(globalDataServiceProvider);
      final image = await http.get(Uri.parse("${global.minioHost}/$urlSubFolder/$id/$urlFileName"));
      put(id, ImageEntity(
        blob1: image.bodyBytes,
        keepAlive: keepAlive
      ));
      return image.bodyBytes;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addImage(String id, Uint8List image, bool keepAlive) async {
    await put(id, ImageEntity(
      blob1: image,
      keepAlive: keepAlive
    ));
  }
  
}

@Riverpod(keepAlive: true)
ImageRepository groupProfileRepo(Ref ref) => ImageRepository("groupProfileRepo", ref: ref, urlSubFolder: "groups", urlFileName: "group_profile.png", maxItems: 20);

@Riverpod(keepAlive: true)
ImageRepository groupProfileSmallRepo(Ref ref) => ImageRepository("groupProfileSmallRepo", ref: ref,urlSubFolder: "groups", urlFileName: "group_profile_small.png", maxItems: 500);

@Riverpod(keepAlive: true)
ImageRepository groupPinImageRepo(Ref ref) => ImageRepository("groupPinImageRepository", ref: ref, urlSubFolder: "groups", urlFileName: "group_pin.png", maxItems: 50);

@Riverpod(keepAlive: true)
ImageRepository userImageSmallRepo(Ref ref) => ImageRepository("userImageSmallRepository", ref: ref, urlSubFolder: "users", urlFileName: "profile_small.png", maxItems: 500);

@Riverpod(keepAlive: true)
ImageRepository userImageRepo(Ref ref) => ImageRepository("userImageRepository", ref: ref, urlSubFolder: "users", urlFileName: "profile.png", maxItems: 50);

