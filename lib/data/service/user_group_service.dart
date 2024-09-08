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
    final group = currentState.firstWhere((group) => group.groupId == updateGroup.groupId, orElse: () => updateGroup);
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
    state = AsyncValue.data(currentState);
  }

  void setIsActive(String groupId, bool isActive) {
    final currentState = state.value ?? [];
    final group = currentState.firstWhere((group) => group.groupId == groupId);
    group.isActivated = isActive;
    state = AsyncValue.data(currentState);
    _groupRepository.createGroup(group);
  }

  Future<void> createGroup(LocalGroupDto group) async {
    try {
      // Optimistically update locally
      await _groupRepository.createGroup(group);
      _updateSingleGroup(group);
      // Sync with the server
      final result = await _groupsApi.addGroup(group.toCreateGroupDto());

      if (result != null) {
        await _groupRepository.createGroup(LocalGroupDto.fromDto(result));
      }
    } catch (e) {
      // Handle errors, possibly rollback changes locally if needed
    }
  }

  Future<void> updateGroup(LocalGroupDto group) async {
    try {
      // Update locally first
      await _groupRepository.createGroup(group);
      _updateSingleGroup(group);

      // Sync with the server
      final result = await _groupsApi.updateGroup(group.groupId, group.toUpdateGroupDto());
      if (result != null) {
        await _groupRepository.createGroup(LocalGroupDto.fromDto(result));
      }
    } catch (e) {
      // Handle errors, rollback changes if necessary
    }
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

  Future<bool> leaveGroup(String groupId) async {
    try {
      await _membersApi.deleteMemberFromGroup(groupId, _data.userId!);
      await _groupRepository.leaveGroup(groupId);
      //state = await AsyncValue.data(await _groupRepository.getMembers(groupId));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<LocalUserDto>> getMembers(String groupId) async {
    try {
      // First try to load members from local database
      final localMembers = await _groupRepository.getMembers(groupId);
      if (localMembers.isNotEmpty) return localMembers;

      // If not found locally, fetch from remote API
      final remoteMembers = await _membersApi.getGroupRanking(groupId);
      List<LocalUserDto> members = [];
      if (remoteMembers == null) return members;
      for (var member in remoteMembers) {
        final memberDto = LocalUserDto.fromRanking(member);
        members.add(memberDto);
        await _userRepository.createUser(memberDto);
      }
      return members;
    } catch (e) {
      return [];
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