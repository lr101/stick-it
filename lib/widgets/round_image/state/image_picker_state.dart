import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_picker_state.g.dart';

@riverpod
class ImagePickerState extends _$ImagePickerState {

  @override
  Future<Uint8List?> build() async {
    return null;
  }

  Future<void> setImage(Function(Uint8List) uploadImage, Uint8List image) async {
    state = AsyncLoading();
    await uploadImage(image);
    state = AsyncData(image);
  }
}