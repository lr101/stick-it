import 'dart:io';
import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/image_entity.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_repository.g.dart';

class ImageRepository extends CacheImpl<ImageEntity> {
  ImageRepository(super.boxName, {
    required this.getImageUrl,
    required this.urlFileName,
    required this.urlSubFolder,
    super.maxItems,
    super.ttlDuration,
  });

  final String urlFileName;
  final String urlSubFolder;
  final Future<String?> Function(String) getImageUrl;


  Future<String?> _getImagePath(String id) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/${urlSubFolder}_${id}_$urlFileName';
  }

  Future<Uint8List?> fetchImage(String id, bool keepAlive) async {
    final cachedImage = await get(id);
    if (cachedImage?.isEmpty == true) {
      return null;
    }
    else if (cachedImage?.filePath != null && File(cachedImage!.filePath).existsSync()) {
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

    /// Fetch and cache an image
  Future<Uint8List?> _fetchAndCacheImage(String id, bool keepAlive) async {
    try {
      final imageUrl = await getImageUrl(id);
      
      if (imageUrl == null) {
        await put(id, ImageEntity(filePath: "", isEmpty: true, keepAlive: keepAlive));
        return null;
      }
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
ImageRepository groupProfileRepo(Ref ref) => ImageRepository("groupProfileRepo", getImageUrl: ref.watch(groupApiProvider).getGroupProfileImage, urlSubFolder: "groups", urlFileName: "group_profile.png", maxItems: 20);

@Riverpod(keepAlive: true)
ImageRepository groupProfileSmallRepo(Ref ref) => ImageRepository("groupProfileSmallRepo", getImageUrl: ref.watch(groupApiProvider).getGroupProfileImageSmall, urlSubFolder: "groups", urlFileName: "group_profile_small.png", maxItems: 500);

@Riverpod(keepAlive: true)
ImageRepository groupPinImageRepo(Ref ref) => ImageRepository("groupPinImageRepository", getImageUrl: ref.watch(groupApiProvider).getGroupPinImage, urlSubFolder: "groups", urlFileName: "group_pin.png", maxItems: 50);

@Riverpod(keepAlive: true)
ImageRepository userImageSmallRepo(Ref ref) => ImageRepository("userImageSmallRepository", getImageUrl: ref.watch(userApiProvider).getUserProfileImageSmall, urlSubFolder: "users", urlFileName: "profile_small.png", maxItems: 500);

@Riverpod(keepAlive: true)
ImageRepository userImageRepo(Ref ref) => ImageRepository("userImageRepository", getImageUrl: ref.watch(userApiProvider).getUserProfileImage, urlSubFolder: "users", urlFileName: "profile.png", maxItems: 50);
