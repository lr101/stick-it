
import 'package:buff_lisa/data/service/shared_preferences_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_order_service.g.dart';

@Riverpod(keepAlive: true)
class GroupOrderService extends _$GroupOrderService {

  @override
  List<String> build() {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    return sharedPrefs.getStringList('groupOrder') ?? [];
  }

  void add(String groupId) {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    final groupOrder = sharedPrefs.getStringList('groupOrder') ?? [];
    groupOrder.add(groupId);
    sharedPrefs.setStringList('groupOrder', groupOrder);
    state = groupOrder;
  }

  void setList(List<String> groupIds) {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    sharedPrefs.setStringList('groupOrder', groupIds);
    state = groupIds;
    ref.notifyListeners();
  }

  void remove(List<String> groupIds) {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    final groupOrder = sharedPrefs.getStringList('groupOrder') ?? [];
    groupOrder.removeWhere((g) => groupIds.contains(g));
    sharedPrefs.setStringList('groupOrder', groupOrder);
    state = groupOrder;
  }
}

