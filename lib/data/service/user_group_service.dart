import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/global_data_dto.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/repository/image_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/no_user_group_service.dart';
import 'package:buff_lisa/widgets/group_selector/service/group_order_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mutex/mutex.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_group_service.g.dart';

@riverpod
class UserGroupService extends _$UserGroupService {
  late GroupRepository _groupRepository;
  late GroupsApi _groupsApi;
  late GlobalDataDto _data;
  late MembersApi _membersApi;
  final Mutex _mutex = Mutex();

  @override
  Future<Set<LocalGroupDto>> build() async {
    _groupRepository = ref.watch(groupRepositoryProvider);
    _groupsApi = ref.watch(groupApiProvider);
    _membersApi = ref.watch(memberApiProvider);
    _data = ref.watch(globalDataServiceProvider);
    final groups = await _groupRepository.getAll();
    return groups.map((e) => LocalGroupDto.fromEntityData(e)).toSet();
  }

  void _updateSingleGroup(LocalGroupDto? currentGroup, LocalGroupDto updateGroup) {
    final stateVal = {...state.value!};
    stateVal.remove(currentGroup);
    stateVal.add(updateGroup);
    state = AsyncData(stateVal);
    _groupRepository.put(updateGroup.groupId, updateGroup.toEntity(keepAlive: true));
  }

  void _updateSingleGroupById(String? groupId, LocalGroupDto updateGroup) {
    final currentGroup = state.value!.where((e) => e.groupId == groupId).firstOrNull;
    if (currentGroup != null) {
      _updateSingleGroup(currentGroup, updateGroup);
    }
  }

  void setIsActive(String groupId, bool isActive) {
    final currentGroup = state.value!.where((e) => e.groupId == groupId).firstOrNull;
    if (currentGroup != null) {
      final updateGroup = currentGroup.copyWith(isActivated: isActive);
      _updateSingleGroup(currentGroup, updateGroup);
    }
  }

  Future<String?> createGroup(CreateGroupDto group) async {
    try {
      final result = await _groupsApi.addGroup(group);
      if (result != null) {
        final group = LocalGroupDto.fromDto(result);
        _updateSingleGroup(null, group);
        return null;
      } else {
        return "Failed to create group remotely unexpectedly";
      }
    } on ApiException catch (e) {
      return e.message;
    }
  }

  Future<String?> updateGroup(UpdateGroupDto group, String groupId) async {
    try {
      // Sync with the server
      final result = await _groupsApi.updateGroup(groupId, group);
      if (result != null) {
        final g = LocalGroupDto.fromDto(result);
        _updateSingleGroupById(groupId, g);
        ref.read(groupProfileRepoProvider).overrideUrl(groupId, result.profileImage!, true);
        ref.read(groupProfileSmallRepoProvider).overrideUrl(groupId, result.profileImageSmall!, true);
        ref.read(groupPinImageRepoProvider).overrideUrl(groupId, result.pinImage!, true);
      } else {
        return "Failed to update group remotely";
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<void> _leaveGroup(String groupId) async {
    await _groupRepository.delete(groupId);
    final currentState = {...state.value!};
    currentState.removeWhere((e) => e.groupId == groupId);
    state = AsyncData(currentState);
  }

  Future<String?> joinGroup(String groupId, {String? inviteUrl}) async {
    try {
      final result = await _membersApi.joinGroup(groupId, _data.userId!, inviteUrl: inviteUrl);
      if (result != null) {
        final group = LocalGroupDto.fromDto(result);
        _updateSingleGroup(null, group);
        ref.read(groupProfileRepoProvider).overrideUrl(groupId, result.profileImage!, true);
        ref.read(groupProfileSmallRepoProvider).overrideUrl(groupId, result.profileImageSmall!, true);
        ref.read(groupPinImageRepoProvider).overrideUrl(groupId, result.pinImage!, true);
      } else {
        return "Failed to join group remotely";
      }
    } on ApiException catch (e) {
      return e.message;
    }
    return null;
  }

  Future<String?> leaveGroup(String groupId, VoidCallback afterSuccess) async {
    try {
      await _membersApi.deleteMemberFromGroup(groupId, _data.userId!);
      afterSuccess();
      _leaveGroup(groupId);
      return null;
    } on ApiException catch (e) {
      if (e.code == 409) {
        return "Cannot leave group as admin, designate a new one first";
      }
      return e.message;
    }
  }
}

@riverpod
Future<LocalGroupDto?> groupById(Ref ref, String groupId) async {
  final groups = await ref.watch(userGroupServiceProvider.future);
  if (groups.any((t) => t.groupId == groupId)) {
    return groups.firstWhereOrNull((t) => t.groupId == groupId);
  } else {
    return ref.watch(noUserGroupServiceProvider(groupId)).value;
  }
}

@riverpod
Future<Set<LocalGroupDto>> activeGroups(Ref ref) async {
  return await ref.watch(userGroupServiceProvider.selectAsync(
      (groups) => groups.where((t) => t.isActivated == true).toSet(),),);
}

@riverpod
Future<List<LocalGroupDto>> orderedGroups(Ref ref) async {
  final groupOrder = ref.watch(groupOrderServiceProvider);
  final groups = await ref.watch(userGroupServiceProvider.future);
  final groupList = groups.toList();
  groupList.sort((a,b) => groupOrder.indexOf(a.groupId) - groupOrder.indexOf(b.groupId));
  return groupList;
}

@riverpod
Future<bool> groupByIdActivated(Ref ref, String groupId) async {
  return await ref.watch(groupByIdProvider(groupId).selectAsync((group) => group!.isActivated));
}

@riverpod
Future<LocalGroupDto> groupByIdWithoutState(Ref ref, String groupId) async {
  final groupEntity = await ref.watch(groupRepositoryProvider).get(groupId);
  return LocalGroupDto.fromEntityData(groupEntity!);
}