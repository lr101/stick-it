
import 'dart:math';

import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_description.g.dart';

@riverpod
class FeedDescription extends _$FeedDescription {
  @override
  bool build(String pinId) {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

@riverpod
class FeedDescriptionHeight extends _$FeedDescriptionHeight {
  @override
  double build(LocalPinDto pin) {
    return 0;
  }

  void setHeight(double height) {
    state = max(0, height - 50);
  }
}
