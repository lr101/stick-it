import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/global_data_dto.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/group_image_service.dart';
import 'package:buff_lisa/data/service/no_user_group_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/widgets/group_selector/service/group_order_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mutex/mutex.dart';
import 'package:openapi/api.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_group_service.g.dart';

@Riverpod(keepAlive: true)
class UserGroupService extends _$UserGroupService {
  late GroupRepository _groupRepository;
  late GroupsApi _groupsApi;
  late GlobalDataDto _data;
  late MembersApi _membersApi;
  Mutex _mutex = Mutex();

  @override
  Future<List<LocalGroupDto>> build() async {
    _groupRepository = ref.watch(groupRepositoryProvider);
    _groupsApi = ref.watch(groupApiProvider);
    _membersApi = ref.watch(memberApiProvider);
    _data = ref.watch(globalDataServiceProvider);
    final groups =  await _groupRepository.getAllGroups();
    sync();
    return groups;
  }

  Future<void> sync() async {
    if (_mutex.isLocked) return;
    await _mutex.acquire();
    try {
      final lastSeen = ref.read(lastSeenProvider(GlobalDataRepository.lastSeenKey));
      final remoteGroups = await _groupsApi.getGroupsByIds(
          userId: _data.userId,
          withUser: true,
          withImages: true,
          updatedAfter: lastSeen);
      state = AsyncData(await _mergeGroups(state.value ?? [], remoteGroups!));
      for (GroupDto group in remoteGroups.items) {
        ref.read(groupImageServiceProvider.notifier).updateGroupImage(group.id, group);
      }
      ref.read(lastSeenProvider(GlobalDataRepository.lastSeenKey).notifier).setLastSeenNow();
    } catch (e) {
      if (kDebugMode) print(e);
    }finally {
      _mutex.release();
      if (kDebugMode) print("Groups synced");
      ref.read(currentUserServiceProvider.notifier).updateFromRemote();
      for (LocalGroupDto group in state.value ?? []) {
        if (group.isActivated) {
          ref.read(pinServiceProvider(group.groupId));
        } else {
          Future.delayed(Duration(seconds: 10), () {
            ref.read(pinServiceProvider(group.groupId));
          });
        }
      }
    }
  }

  Future<List<LocalGroupDto>> _mergeGroups(
      List<LocalGroupDto> localGroups, GroupsSyncDto remoteGroups) async {
    Map<String, LocalGroupDto> localGroupsMap = {
      for (var group in localGroups) group.groupId: group
    };
    localGroupsMap.removeWhere((k, v) => remoteGroups.deleted.contains(k));
    for (var group in remoteGroups.items) {
      final g = LocalGroupDto.fromDto(group);
      localGroupsMap[group.id] = g;
      _groupRepository.createGroup(g);
    }
    remoteGroups.deleted
        .forEach((a) async => await _groupRepository.deleteGroup(a));
    return localGroupsMap.values.toList();
  }

  void _updateSingleGroup(LocalGroupDto updateGroup) {
    final currentState = state.value ?? [];
    state = AsyncLoading();
    final groupIndex = currentState
        .indexWhere((group) => group.groupId == updateGroup.groupId);
    LocalGroupDto group;
    if (groupIndex == -1) {
      group = updateGroup;
      currentState.add(group);
    } else {
      group = currentState[groupIndex];
      group.isActivated = updateGroup.isActivated;
      group.lastUpdated = DateTime.now();
      group.name = updateGroup.name;
      group.description = updateGroup.description;
      group.groupAdmin = updateGroup.groupAdmin;
      group.link = updateGroup.link;
      group.inviteUrl = updateGroup.inviteUrl;
      group.visibility = updateGroup.visibility;
    }

    state = AsyncData(currentState);
  }

  void setIsActive(String groupId, bool isActive) {
    final currentState = state.value ?? [];
    final group = currentState.firstWhere((group) => group.groupId == groupId);
    group.isActivated = isActive;
    state = AsyncValue.data(currentState);
    _groupRepository.createGroup(group);
  }

  Future<String?> createGroup(CreateGroupDto group) async {
    try {
      final result = await _groupsApi.addGroup(group);
      if (result != null) {
        final group = LocalGroupDto.fromDto(result);
        _updateSingleGroup(group);
        await _groupRepository.createGroup(group);
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
        final g = await LocalGroupDto.fromDto(result);
        await _groupRepository.createGroup(g);
        _updateSingleGroup(g);
        ref.read(groupImageServiceProvider.notifier).updateGroupImage(groupId, result);
      } else {
        return "Failed to update group remotely";
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<void> deleteGroup(String groupId) async {
    try {
      // Sync with the server
      await _groupsApi.deleteGroup(groupId);
      // Delete locally
      await _groupRepository.deleteGroup(groupId);
      state.value?.removeWhere((e) => e.groupId == groupId);
    } catch (e) {
      // Handle errors, rollback changes if necessary
    }
  }

  Future<List<LocalGroupDto>> getActiveGroups() async {
    return await _groupRepository.getActiveGroups();
  }

  Future<String?> joinGroup(String groupId, {String? inviteUrl}) async {
    try {
      final result = await _membersApi.joinGroup(groupId, _data.userId!,
          inviteUrl: inviteUrl);
      if (result != null) {
        final group = await LocalGroupDto.fromDto(result);
        _updateSingleGroup(group);
        await _groupRepository.createGroup(group);
        ref.read(groupImageServiceProvider.notifier).updateGroupImage(groupId, result);
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
      await ref.watch(memberApiProvider).deleteMemberFromGroup(groupId, _data.userId!);
      await _membersApi.deleteMemberFromGroup(groupId, _data.userId!);
      afterSuccess();
      await _groupRepository.leaveGroup(groupId);
      state.value!.removeWhere((e) => e.groupId == groupId);
      ref.notifyListeners();
      ref.read(groupImageServiceProvider.notifier).deleteGroupImage(groupId);
      return null;
    } on ApiException catch (e) {
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

@Riverpod(keepAlive: true)
Future<List<LocalGroupDto>> activeGroups(Ref ref) async {
  return ref.watch(userGroupServiceProvider.selectAsync(
      (groups) => groups.where((t) => t.isActivated == true).toList()));
}

@riverpod
Future<List<LocalGroupDto>> orderedGroups(Ref ref) async {
  final groupOrder = ref.watch(groupOrderServiceProvider);
  final groups = ref.watch(userGroupServiceProvider).value ?? [];
  groups.sort((a,b) => groupOrder.indexOf(a.groupId) - groupOrder.indexOf(b.groupId));
  return groups;
}

@riverpod
Future<bool> groupByIdActivated(Ref ref, String groupId) async {
  return ref.watch(groupByIdProvider(groupId).selectAsync((group) => group!.isActivated));
}
