import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/global_data_dto.dart';
import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/repository/image_repository.dart';
import 'package:buff_lisa/data/repository/pin_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/syncing_service.dart';
import 'package:buff_lisa/widgets/group_selector/service/group_order_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mutex/mutex.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_group_service.g.dart';


@riverpod
class GroupService extends _$GroupService {


  late final GroupRepository _groupRepository;
  late final GroupsApi _groupsApi;

  @override
  Stream<GroupEntity?> build(String groupId) async* {
    _groupRepository = ref.watch(groupRepositoryProvider);
    _groupsApi = ref.watch(groupApiProvider);
    final userGroups = ref.watch(userGroupServiceProvider).value ?? [];

    _remoteFetchIfNotExist(userGroups);

    final stream = await _groupRepository.watchById(groupId);
    yield* stream;
  }

  Future<void> _remoteFetchIfNotExist(List<GroupEntity> userGroups) async {
    final group = await _groupRepository.get(groupId);
    final isUserGroup = userGroups.any((e) => e.groupId == groupId);
    if (group == null) {
      final groupDto = await _groupsApi.getGroup(groupId);
      if (groupDto != null) {
        await _groupRepository.put(GroupEntity.fromGroupDto(groupDto, !isUserGroup, isUserGroup));
      }
    }
  }

}


@riverpod
Stream<GroupEntity?> groupById(Ref ref, String groupId) async* {
  final repo = ref.watch(groupRepositoryProvider);
  final userGroups = ref.watch(userGroupServiceProvider).value ?? [];
  final isUserGroup = userGroups.any((e) => e.groupId == groupId);
  final exists = await repo.get(groupId);
  if (exists == null) {
    final pin = await  ref.watch(groupApiProvider).getGroup(groupId);
    await repo.put(GroupEntity.fromGroupDto(pin!, true, isUserGroup));
  }
  yield* repo.watchById(groupId);
}

@riverpod
class UserGroupService extends _$UserGroupService {

  late final GroupRepository _groupRepository;
  late final MembersApi _membersApi;
  late final GroupsApi _groupsApi;
  late final PinRepository _pinRepository;
  late final PinsApi _pinsApi;
  late final String _userId;

  @override
  Stream<List<GroupEntity>> build() async* {
    // watch providers
    _groupRepository = ref.watch(groupRepositoryProvider);
    _membersApi = ref.watch(memberApiProvider);
    _groupsApi = ref.watch(groupApiProvider);
    _pinRepository = ref.watch(pinRepositoryProvider);
    _pinsApi = ref.watch(pinApiProvider);
    _userId = ref.watch(userIdProvider);

    // listen to repository so that updates propagate automatically
    final stream = _groupRepository.watchUserGroups();
    yield* stream;
  }

  Future<String?> joinGroup(String groupId, {String? inviteUrl}) async {
    try {
      final result = await _membersApi.joinGroup(groupId, _userId, inviteUrl: inviteUrl);
      if (result != null) {
        // update group entity
        final entity = GroupEntity.fromGroupDto(result, false, true,isActivated: true,keepAlive: true);
        _groupRepository.put(entity);

        // update group pins
        final pins = await _pinsApi.getPinImagesByIds(groupId: groupId, withImage: false);
        final pinEntities = pins?.items.map((e) => PinEntity.fromDto(e, false)).toList() ?? [];
        await _pinRepository.putMultiple(pinEntities);

        // update group pictures
        ref.read(groupProfileRepoProvider).overrideUrl(groupId, result.profileImage!, true);
        ref.read(groupProfileSmallRepoProvider).overrideUrl(groupId, result.profileImageSmall!, true);
        ref.read(groupPinImageRepoProvider).overrideUrl(groupId, result.pinImage!, true);
        ref.read(syncingServiceProvider.notifier).syncPins(groupId, null);
      } else {
        return "Failed to join group remotely";
      }
    } on ApiException catch (e) {
      return e.message;
    }
    return null;
  }

  Future<String?> _leaveGroup(String groupId) async {
    try {
      await _membersApi.deleteMemberFromGroup(groupId, _userId);
      final groupEntity = await _groupRepository.get(groupId);
      if (groupEntity != null) {

        // remove from userGroups
        groupEntity.userIsMember = false;
        await _groupRepository.put(groupEntity);

        // make group pins not keepAlive and onlySession
        await _pinRepository.updateKeepAlive(groupId, false, true);
      }
    } on ApiException catch(_) {
      return "Failed ro leave group";
    }
    return null; 
  }


    Future<String?> createGroup(GroupEntity data, Uint8List image) async {
    try {
      final createDto = data.toCreateGroupDto(image);
      final result = await _groupsApi.addGroup(createDto);
      if (result != null) {
        final entity = GroupEntity.fromGroupDto(
          result,
          /* onlySession */ false,
          /* userIsMember */ true,
          isActivated: true,
          keepAlive: true,
        );
        await _groupRepository.put(entity);
        return null;
      } else {
        return "Failed to create group remotely unexpectedly";
      }
    } on ApiException catch (e) {
      return e.message;
    }
  }

  Future<String?> updateGroup(GroupEntity data, String groupId, {Uint8List? image}) async {
    try {
      final updateDto = data.toUpdateGroupDto(image);
      final result = await _groupsApi.updateGroup(groupId, updateDto);
      if (result != null) {
        final entity = GroupEntity.fromGroupDto(result,/* onlySession */ false,/* userIsMember */ true,isActivated: true,keepAlive: true,);
        await _groupRepository.put(entity);
        
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


}


@riverpod
Future<Set<GroupEntity>> activeGroups(Ref ref) async {
  return await ref.watch(userGroupServiceProvider.selectAsync(
      (groups) => groups.where((t) => t.isActivated == true).toSet(),),);
}

@riverpod
Future<List<GroupEntity>> orderedGroups(Ref ref) async {
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
Future<GroupEntity?> groupByIdWithoutState(Ref ref, String groupId) async {
  return await ref.watch(groupRepositoryProvider).get(groupId);
}
