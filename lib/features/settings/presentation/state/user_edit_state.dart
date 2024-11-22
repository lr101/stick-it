import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/service/global_data_service.dart';
import '../../../../data/service/user_image_service.dart';

part 'user_edit_state.g.dart';

@riverpod
class UserEditState extends _$UserEditState {

  bool _hasChanged = false;

  bool get hasChanged => _hasChanged;

  @override
  Uint8List? build() {
    return ref.watch(profilePictureByIdProvider(ref.watch(globalDataServiceProvider).userId!)).value;
  }

  void update(Uint8List image) {
    state = image;
    _hasChanged = true;
  }
}
