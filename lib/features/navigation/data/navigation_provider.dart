
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

@Riverpod(keepAlive: true)
class NavigationState extends _$NavigationState {


  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}