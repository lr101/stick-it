import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/global_data_dto.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:drift/drift.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/user_dto.dart';
import '../repository/user_repository.dart';

part 'user_group_service.g.dart';

@Riverpod(keepAlive: true)
class UserGroupService extends _$UserGroupService {

  late GroupRepository _groupRepository;
  late GroupsApi _groupsApi;
  late GlobalDataDto _data;
  late UserRepository _userRepository;
  late MembersApi _membersApi;


  @override
  Future<List<LocalGroupDto>> build() async {
    _groupRepository = ref.watch(groupRepositoryProvider);
    _groupsApi = ref.watch(groupApiProvider);
    _userRepository = ref.watch(userRepositoryProvider);
    _membersApi = ref.watch(memberApiProvider);
    _data = ref.watch(globalDataServiceProvider);
    try {
      // First try to load groups from local database
      final localGroups = await _groupRepository.getAllGroups();
      if (localGroups.isNotEmpty) return localGroups;

      // If no groups are found locally, fetch from remote and cache locally
      final remoteGroups = await _groupsApi.getGroupsByIds(
          userId: _data.userId, withUser: true, withImages: true);
      List<LocalGroupDto> groups = [];
      if (remoteGroups == null) return groups;
      for (var group in remoteGroups) {
        final groupDto = LocalGroupDto.fromDto(group);
        groups.add(groupDto);
        await _groupRepository.createGroup(groupDto);
      }
      return groups;
    } catch (e) {
      print(e);
      return [];
    }
  }

  void _updateSingleGroup(LocalGroupDto updateGroup) {
    final currentState = state.value ?? [];
    state = AsyncLoading();
    final groupIndex = currentState.indexWhere((group) => group.groupId == updateGroup.groupId);
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
      final result = await _membersApi.joinGroup(groupId, _data.userId!, inviteUrl: inviteUrl);
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
  return ref.watch(userGroupServiceProvider.selectAsync((groups) => groups.firstWhere((t) => t.groupId == groupId)));
}

@Riverpod(keepAlive: true)
Future<Uint8List> groupImageById(GroupImageByIdRef ref, String groupId) async {
  return ref.watch(groupByIdProvider(groupId).select((group) => group.value!.profileImage));
}

@Riverpod(keepAlive: true)
Future<Uint8List> groupPinImageById(GroupPinImageByIdRef ref, String groupId) async {
  return ref.watch(groupByIdProvider(groupId).select((group) => group.value!.pinImage));
}

@Riverpod(keepAlive: true)
Future<List<LocalGroupDto>> activeGroups(ActiveGroupsRef ref) async {
  return ref.watch(userGroupServiceProvider.selectAsync((groups) => groups.where((t) => t.isActivated == true).toList()));
}