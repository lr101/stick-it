

import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/pin_image_service.dart';
import 'package:buff_lisa/features/auth/data/login_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'marker_window_state.g.dart';

@riverpod
class MarkerWindowState extends _$MarkerWindowState {

  @override
  LocalPinDto? build() {
    return null;
  }

  void openPopup(LocalPinDto pin) {
    if (state?.id == pin.id) {
      state = null;
      return;
    }
    ref.read(pinImageServiceProvider.notifier).addImage(pin.id);
    state = pin;
  }

}