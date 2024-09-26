
import 'dart:convert';
import 'dart:typed_data';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/repository/pin_image_repository.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_image_service.g.dart';

@Riverpod(keepAlive: true)
class PinImageService extends _$PinImageService {

  late PinImageRepository _imageRepository;

  @override
  Future<Map<String, Uint8List>> build() async {
    _imageRepository = ref.watch(pinImageRepositoryProvider);
    return await _imageRepository.fetchAllCashedImages();
  }

  Future<void> addImage(String pinId, {bool removeKeepAlive = false}) async {
    final image = await _imageRepository.fetchImage(pinId, removeKeepAlive: removeKeepAlive);
    state = AsyncData({...state.value ?? {}, pinId: image});
  }

  Future<void> addUint8ListImage(String pinId, Uint8List image) async {
    state = AsyncData({...state.value ?? {}, pinId: image});
    await _imageRepository.addImage(pinId, image);
  }

  Future<void> addOfflineImage(String pinId, Uint8List image) async {
      state = AsyncData({...state.value ?? {}, pinId: image});
      await _imageRepository.addOfflineImage(pinId, image);
  }

  Future<String?> addImages(List<String> pinIds) async {
    final missingImages = <String>[];
    for (var pinId in pinIds) {
      if (state.value == null || !state.value!.containsKey(pinId)) {
        missingImages.add(pinId);
      }
    }
    if (missingImages.isEmpty) return null;
    try {
      final image = await ref.watch(pinApiProvider).getPinImagesByIds(
          ids: missingImages, withImage: true);
      final map = {...state.value ?? {}};
      if (image != null) {
        for (var pin in image.items) {
          final uintImage = base64Decode(pin.image!).buffer.asUint8List();
          map[pin.id] = uintImage;
          await _imageRepository.addImage(pin.id, uintImage);
        }
      }
      state = AsyncData(map);
      return null;
    } on ApiException catch(e) {
      return e.message;
    }

  }

}

@riverpod
Future<Uint8List?> getPinImage(GetPinImageRef ref, String pinId) async {
  return await ref.watch(pinImageServiceProvider.selectAsync((e) => e[pinId]));
}