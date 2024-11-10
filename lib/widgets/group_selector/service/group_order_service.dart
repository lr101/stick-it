import 'package:buff_lisa/data/service/shared_preferences_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_order_service.g.dart';

@Riverpod(keepAlive: true)
class GroupOrderService extends _$GroupOrderService {
  @override
  List<String> build() {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    final orderedGroups = sharedPrefs.getStringList('groupOrder') ?? [];
    state = orderedGroups;

    // Watch userGroupServiceProvider and update orderedGroups accordingly
    ref.listen(userGroupServiceProvider, (previous, next) {
      _syncGroupsWithUserList((next.value??[]).map((e) => e.groupId).toList());
    });

    return orderedGroups;
  }

  void _syncGroupsWithUserList(List<String> userGroupList) {
    final userGroupSet = Set<String>.from(userGroupList);
    List<String> updatedGroups = state.where((id) => userGroupSet.contains(id)).toList();
    updatedGroups.addAll(userGroupList.where((id) => !updatedGroups.contains(id)));
    if (updatedGroups != state) {
      setList(updatedGroups);
    }
  }

  void setList(List<String> groupIds) {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    sharedPrefs.setStringList('groupOrder', groupIds);
    state = groupIds;
    ref.notifyListeners();
  }
}
