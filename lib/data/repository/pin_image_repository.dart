import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/pin_image_entity.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entity/database.dart';

part 'pin_image_repository.g.dart';

class PinImageRepository {
  final Ref ref;
  final int maxCacheSize;
  late Database _db;

  PinImageRepository({required this.ref, required this.maxCacheSize}) {
    _db = ref.watch(databaseProvider);
  }

  // Fetch image, either from cache or from API
  Future<Uint8List> fetchImage(String pinId, {bool removeKeepAlive = false}) async {
    // Check if the image is already in the cache
    final cachedImage = await (_db.select(_db.pinImageEntity)..where((tbl) => tbl.pinId.equals(pinId))).getSingleOrNull();
    if (cachedImage != null) {
      _updateHitCount(cachedImage, removeKeepAlive);
      return cachedImage.image;
    }

    // If not in cache, fetch from API and cache it
    return await _fetchAndCacheImage(pinId);
  }

  Future<Map<String, Uint8List>> fetchAllCashedImages() async {
    final images = <String, Uint8List>{};
    final cachedImages = await (_db.select(_db.pinImageEntity)).get();
    for (var image in cachedImages) {
      images[image.pinId] = image.image;
    }
    return images;
  }

  // Fetch the image from the API and cache it
  Future<Uint8List> _fetchAndCacheImage(String pinId) async {
    try {
     final image = await ref.watch(pinApiProvider).getPin(pinId, withImage: true);
     final decodedImage = base64Decode(image!.image!);
     await _addImageToCache(PinImageEntityCompanion(
       pinId: Value(pinId),
       image: Value(decodedImage),
       lastAccessed: Value(DateTime.now()),
     ));
     return decodedImage;
    } catch (e) {
      throw e;
    }
  }

  Future<void> addImage(String pinId, Uint8List image) async {
    await _addImageToCache(PinImageEntityCompanion(
      pinId: Value(pinId),
      image: Value(image),
      lastAccessed: Value(DateTime.now()),
      keepAlive: Value(false),
    ));
  }

  Future<void> addOfflineImage(String pinId, Uint8List image) async {
    await _addImageToCache(PinImageEntityCompanion(
      pinId: Value(pinId),
      image: Value(image),
      lastAccessed: Value(DateTime.now()),
      keepAlive: Value(true),
    ));
  }

  Future<void> _addImageToCache(PinImageEntityCompanion cachedImage) async {
    final cacheCount = await (_db.select(_db.pinImageEntity)).get().then((rows) => rows.length);
    if (cacheCount >= maxCacheSize) {
      await _deleteLeastUsedImage();
    }
    await _db.into(_db.pinImageEntity).insertOnConflictUpdate(cachedImage);
  }

  Future<void> _deleteLeastUsedImage() async {
    final leastUsedImage = await (_db.select(_db.pinImageEntity)..orderBy([(tbl) => OrderingTerm(expression: tbl.hitCount, mode: OrderingMode.asc)])).getSingleOrNull();
    if (leastUsedImage != null) {
      await (_db.delete(_db.pinImageEntity)..where((tbl) => tbl.pinId.equals(leastUsedImage.pinId))).go();
    }
  }


  // Update the hit count and last accessed time
  Future<void> _updateHitCount(PinImageEntityData cachedImage, bool removeKeepAlive) async {
    final updatedEntry = cachedImage.copyWith(
      hitCount: cachedImage.hitCount + 1,
      lastAccessed: DateTime.now(),
    );
    await _db.into(_db.pinImageEntity).insertOnConflictUpdate(PinImageEntityCompanion(
      pinId: Value(updatedEntry.pinId),
      image: Value(updatedEntry.image),
      hitCount: Value(updatedEntry.hitCount),
      lastAccessed: Value(updatedEntry.lastAccessed),
      keepAlive: Value(removeKeepAlive ? false : updatedEntry.keepAlive),
    ));
  }
}

@Riverpod(keepAlive: true)
PinImageRepository pinImageRepository(PinImageRepositoryRef ref) {
  return PinImageRepository(ref: ref, maxCacheSize: 1000);
}
