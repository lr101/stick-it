
import 'dart:convert';
import 'dart:typed_data';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_image_service.g.dart';

@Riverpod(keepAlive: true)
class PinImageService extends _$PinImageService {

  @override
  Future<Map<String, Uint8List>> build() async => {};


  Future<void> addImage(String pinId) async {
    final image = await ref.watch(pinApiProvider).getPinImage(pinId);
    if (image != null) {
      state = AsyncData({...state.value ?? {}, pinId: base64Decode(image).buffer.asUint8List()});
    }
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
        for (var pin in image) {
          map[pin.id] = base64Decode(pin.image!).buffer.asUint8List();
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