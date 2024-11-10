import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:buff_lisa/data/service/pin_image_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'image_service.g.dart';

class PinImageInfo {
  PinImageInfo({required this.image, required this.width, required this.height});
  final Uint8List image;
  final int width;
  final int height;
}

@riverpod
Future<PinImageInfo?> getPinImageInfo(GetPinImageInfoRef ref, String pinId) async {
  final imageData = await ref.watch(getPinImageAndFetchProvider(pinId));
  if (imageData.value == null) return null;
  final Completer<ui.Image> completer = Completer();
  ui.decodeImageFromList(imageData.value!, (ui.Image img) {
    completer.complete(img);
  });
  final res = await completer.future;
  return PinImageInfo(image: imageData.value!, width: res.width, height: res.height);
}