

import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'marker_window_state.g.dart';

@riverpod
class MarkerWindowState extends _$MarkerWindowState {

  @override
  LocalPinDto? build() {
    return null;
  }

  void openPopup(LocalPinDto pin) {
    state = pin;
  }

}