import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ranking_state.g.dart';

@riverpod
class RankingMap extends _$RankingMap {
  @override
  int build() {
    return 2;
  }

  // ignore: use_setters_to_change_properties
  void update(int index) {
    state = index;
  }
}

@riverpod
class RankingType extends _$RankingType {
  @override
  int build() {
    return 0;
  }

  // ignore: use_setters_to_change_properties
  void update(int index) {
    state = index;
  }
}
