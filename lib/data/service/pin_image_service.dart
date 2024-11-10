
import 'dart:convert';
import 'dart:typed_data';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/repository/pin_image_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

}

@riverpod
Future<Uint8List?> getPinImageAndFetch(Ref ref, String pinId) async {
  final image = await ref.watch(pinImageServiceProvider.selectAsync((e) => e[pinId]));
  if (image == null) {
    ref.watch(pinImageServiceProvider.notifier).addImage(pinId);
  }
  return image;
}