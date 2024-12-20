import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ranking_state.g.dart';

@riverpod
class RankingMap extends _$RankingMap {
  @override
  int build() {
    return 2;
  }

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

  void update(int index) {
    state = index;
  }
}
