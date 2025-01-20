
import 'dart:typed_data';
import 'package:buff_lisa/data/entity/image_entity.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../service/global_data_service.dart';

part 'group_image_repository.g.dart';

class GroupImageRepository extends CacheImpl<ImageEntity> {
  GroupImageRepository(super.boxName, {required this.ref, required this.url, super.maxItems = 500});

  final String url;
  final Ref ref;

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

  Future<Uint8List> fetchImage(String groupId, bool userGroup) async {
    final cachedImage = await get(groupId); // Use the get method from CacheImpl
    if (cachedImage != null) {
      return cachedImage.blob1!;
    }
    return await _fetchAndCacheImage(groupId, userGroup);
  }

  Future<Uint8List> overrideUrl(String groupId, String url, bool userGroup) async {
    try {
      final image = await http.get(Uri.parse(url));

      if (userGroup) {
        await put(groupId, ImageEntity(
            blob1: image.bodyBytes,
            ttl: DateTime.now().add(Duration(days: 7)),
            keepAlive: userGroup
        ));
      }
      return image.bodyBytes;
    } catch (e) {
      rethrow;
    }
  }



  // Fetch the image from the API and cache it
  Future<Uint8List> _fetchAndCacheImage(String groupId, bool userGroup) async {
    try {
      final global = ref.watch(globalDataServiceProvider);
      final image = await http.get(Uri.parse("${global.minioHost}/groups/$groupId/$url"));
      put(groupId, ImageEntity(
        blob1: image.bodyBytes,
          ttl: DateTime.now().add(Duration(days: 7)),
        keepAlive: userGroup
      ));
      return image.bodyBytes;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addImage(String groupId, Uint8List image) async {
    await put(groupId, ImageEntity( // Use the put method from CacheImpl
      blob1: image,
      ttl: DateTime.now().add(Duration(days: 7)),
    ));
  }

  Future<void> deleteGroupImage(String groupId) async {
    await delete(groupId);
  }
}

@riverpod
GroupImageRepository groupProfileRepo(Ref ref) => GroupImageRepository("groupProfileRepo", ref: ref, url: "group_profile.png", maxItems: 20);

@riverpod
GroupImageRepository groupProfileSmallRepo(Ref ref) => GroupImageRepository("groupProfileSmallRepo", ref: ref ,url: "group_profile_small.png", maxItems: 200);

@riverpod
GroupImageRepository groupPinImageRepo(Ref ref) => GroupImageRepository("groupPinImageRepository", ref: ref,  url: "group_pin.png", maxItems: 50);
