
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_panel_state.g.dart';

@riverpod
class MapPanelState extends _$MapPanelState {
  @override
  bool build() {
    return false;
  }

  void set(bool val) {
    print(val);
    state = val;
  }
}
