import 'dart:io';
import 'dart:typed_data';
import 'package:buff_lisa/data/entity/image_entity.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_repository.g.dart';

class ImageRepository extends CacheImpl<ImageEntity> {
  ImageRepository(super.boxName, {
    required this.ref,
    required this.urlFileName,
    required this.urlSubFolder,
    super.maxItems,
    super.ttlDuration,
  });

  final String urlFileName;
  final String urlSubFolder;
  final Ref ref;


  Future<String?> _getImagePath(String id) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/${urlSubFolder}_${id}_$urlFileName';
  }

  Future<Uint8List> fetchImage(String id, bool keepAlive) async {
    final cachedImage = await get(id);
    if (cachedImage?.filePath != null && File(cachedImage!.filePath).existsSync()) {
      return await File(cachedImage.filePath).readAsBytes();
    }
    return await _fetchAndCacheImage(id, keepAlive);
  }

  Future<Uint8List> overrideUrl(String id, String url, bool keepAlive) async {
    try {
      final image = await http.get(Uri.parse(url));
      final filePath = await _getImagePath(id);
      if (filePath != null) {
        await File(filePath).writeAsBytes(image.bodyBytes);
        if (keepAlive) {
          await put(id, ImageEntity(filePath: filePath, keepAlive: keepAlive));
        }
      }
      return image.bodyBytes;
    } catch (e) {
      rethrow;
    }
  }

  Future<Uint8List> _fetchAndCacheImage(String id, bool keepAlive) async {
    try {
      final global = ref.watch(globalDataServiceProvider);
      final imageUrl = "${global.minioHost}/$urlSubFolder/$id/$urlFileName";
      final image = await http.get(Uri.parse(imageUrl));
      final filePath = await _getImagePath(id);

      if (filePath != null) {
        await File(filePath).writeAsBytes(image.bodyBytes);
        await put(id, ImageEntity(filePath: filePath, keepAlive: keepAlive));
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
      await put(id, ImageEntity(filePath: filePath, keepAlive: keepAlive));
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
ImageRepository groupProfileRepo(Ref ref) => ImageRepository("groupProfileRepo", ref: ref, urlSubFolder: "groups", urlFileName: "group_profile.png", maxItems: 20);

@Riverpod(keepAlive: true)
ImageRepository groupProfileSmallRepo(Ref ref) => ImageRepository("groupProfileSmallRepo", ref: ref, urlSubFolder: "groups", urlFileName: "group_profile_small.png", maxItems: 500);

@Riverpod(keepAlive: true)
ImageRepository groupPinImageRepo(Ref ref) => ImageRepository("groupPinImageRepository", ref: ref, urlSubFolder: "groups", urlFileName: "group_pin.png", maxItems: 50);

@Riverpod(keepAlive: true)
ImageRepository userImageSmallRepo(Ref ref) => ImageRepository("userImageSmallRepository", ref: ref, urlSubFolder: "users", urlFileName: "profile_small.png", maxItems: 500);

@Riverpod(keepAlive: true)
ImageRepository userImageRepo(Ref ref) => ImageRepository("userImageRepository", ref: ref, urlSubFolder: "users", urlFileName: "profile.png", maxItems: 50);
