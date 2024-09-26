
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

@Riverpod(keepAlive: true)
class NavigationState extends _$NavigationState {


  @override
  int build() {
    return 2;
  }

  void setIndex(int index) {
    state = index;
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

