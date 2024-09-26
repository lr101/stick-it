import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/global_data_dto.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/member_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/reachability_service.dart';
import 'package:buff_lisa/data/service/syncing_service_schedular.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:mutex/mutex.dart';
import 'package:openapi/api.dart';
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
    this.state = AsyncData(await _groupRepository.getAllGroups());
    await sync();
    return state.value ?? [];
  }

  Future<void> sync() async {
    if (_mutex.isLocked) return;
    await _mutex.acquire();
    try {
      ref.read(syncingServiceSchedularProvider.notifier).setState(SyncingServiceSchedularState.loading);
      final lastSeen = ref.read(lastSeenProvider(GlobalDataRepository.lastSeenKey));
      final remoteGroups = await _groupsApi.getGroupsByIds(
          userId: _data.userId,
          withUser: true,
          withImages: true,
          updatedAfter: lastSeen);
      state = AsyncData(await _mergeGroups(state.value ?? [], remoteGroups!));
      ref.read(lastSeenProvider(GlobalDataRepository.lastSeenKey).notifier).setLastSeenNow();
      ref.read(syncingServiceSchedularProvider.notifier).setState(SyncingServiceSchedularState.done);
    } catch (e) {
      if (kDebugMode) print(e);
    }finally {
      _mutex.release();
      // Activate providers
      for (var group in state.value ?? <LocalGroupDto>[]) {
        ref.read(pinServiceProvider(group.groupId));
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
      group.pinImage = updateGroup.pinImage;
      group.lastUpdated = DateTime.now();
      group.profileImage = updateGroup.profileImage;
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
        await _groupRepository.createGroup(LocalGroupDto.fromDto(result));
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
        final group = LocalGroupDto.fromDto(result);
        _updateSingleGroup(group);
        await _groupRepository.createGroup(group);
      } else {
        return "Failed to join group remotely";
      }
    } on ApiException catch (e) {
      return e.message;
    }
    return null;
  }

  Future<void> reloadGroupFromRemote(LocalGroupDto group) async {
    try {
      final result = await _groupsApi.getGroup(group.groupId);
      if (result != null) {
        await _groupRepository.createGroup(LocalGroupDto.fromDto(result));
        _updateSingleGroup(group);
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> leaveGroup(String groupId) async {
    try {
      await _membersApi.deleteMemberFromGroup(groupId, _data.userId!);
      await _groupRepository.leaveGroup(groupId);
      state.value!.removeWhere((e) => e.groupId == groupId);
      ref.notifyListeners();
      return null;
    } on ApiException catch (e) {
      return e.message;
    }
  }
}

@Riverpod(keepAlive: true)
Future<LocalGroupDto?> groupById(GroupByIdRef ref, String groupId) async {
  return ref.watch(userGroupServiceProvider
      .selectAsync((groups) => groups.firstWhere((t) => t.groupId == groupId)));
}

@Riverpod(keepAlive: true)
Future<Uint8List> groupImageById(GroupImageByIdRef ref, String groupId) async {
  return ref.watch(
      groupByIdProvider(groupId).select((group) => group.value!.profileImage));
}

@Riverpod(keepAlive: true)
Future<Uint8List> groupPinImageById(
    GroupPinImageByIdRef ref, String groupId) async {
  return ref.watch(
      groupByIdProvider(groupId).select((group) => group.value!.pinImage));
}

@Riverpod(keepAlive: true)
Future<List<LocalGroupDto>> activeGroups(ActiveGroupsRef ref) async {
  return ref.watch(userGroupServiceProvider.selectAsync(
      (groups) => groups.where((t) => t.isActivated == true).toList()));
}
