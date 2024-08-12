import 'dart:convert';
import 'dart:typed_data';
import 'package:buff_lisa/Files/DTOClasses/group.dart';
import 'package:buff_lisa/Files/Other/global.dart' as global;
import 'package:openapi/api.dart';

class FetchGroups {
  static final GroupsApi _groupsApi = global.openApiServices.groupApi;
  static final MembersApi _membersApi = global.openApiServices.memberApi;

  static Future<List<Group>> getUserGroups() async {
    String userId = global.localData.userId;
    List<GroupDto>? groupDtos = await _groupsApi.getGroupsByIds(userId: userId, withUser: true);

    if (groupDtos != null) {
      await global.localData.groupRepo.clear();
      return groupDtos.map((dto) => Group.fromDto(dto)).toList();
    } else {
      throw Exception("Groups could not be loaded");
    }
  }

  static Future<Group> getGroup(String groupId, [saveOffline = true]) async {
    GroupDto? groupDto = await _groupsApi.getGroup(groupId);

    if (groupDto != null) {
      return Group.fromDto(groupDto, saveOffline);
    } else {
      throw Exception("Group could not be loaded");
    }
  }

  static Future<List<Group>> getGroups(List<String> groupIds) async {
    List<String> ids = groupIds.map((id) => id).toList();
    List<GroupDto>? groupDtos = await _groupsApi.getGroupsByIds(ids: ids);

    if (groupDtos != null) {
      return groupDtos.map((dto) => Group.fromDto(dto)).toList();
    } else {
      throw Exception("Groups could not be loaded");
    }
  }

  static Future<List<Group>> fetchAllGroupsWithoutUserGroupsIds(String? searchValue, int page, int size) async {
    List<GroupDto>? groupDtos = await _groupsApi.getGroupsByIds(search: searchValue, withUser: false, userId: global.localData.userId, withImages: true, page: page, size: size);

    if (groupDtos != null) {
      return groupDtos.map((dto) => Group.fromDto(dto)).toList();
    } else {
      throw Exception("Groups could not be loaded");
    }
  }

  static Future<Group?> postGroup(String name, String description, Uint8List image, Visibility visibility, String? link) async {
    CreateGroupDto createGroupDto = CreateGroupDto(
      name: name,
      groupAdmin: global.localData.userId,
      description: description,
      profileImage: base64Encode(image),
      visibility: visibility,
      link: link ?? "",
    );
    GroupDto? groupDto = await _groupsApi.addGroup(createGroupDto);

    if (groupDto != null) {
      return Group.fromDto(groupDto);
    } else {
      throw Exception("Group could not be created");
    }
  }

  static Future<Group?> putGroup(String groupId, String? name, String? description, Uint8List? image, Visibility visibility, String? groupAdmin, String? link) async {
    UpdateGroupDto updateGroupDto = UpdateGroupDto(
      name: name,
      description: description,
      profileImage: image != null ? base64Encode(image) : null,
      visibility: visibility,
      groupAdmin: groupAdmin,
      link: link,
    );
    GroupDto? groupDto = await _groupsApi.updateGroup(groupId, updateGroupDto);

    if (groupDto != null) {
      return Group.fromDto(groupDto);
    } else {
      return null;
    }
  }

  static Future<Group> joinGroup(String groupId, String? inviteUrl) async {
    JoinGroupRequest joinGroupDto = JoinGroupRequest(
      inviteUrl: inviteUrl ?? "",
    );
    GroupDto? groupDto = await _membersApi.joinGroup(groupId, global.localData.userId, joinGroupDto);

    if (groupDto != null) {
      return Group.fromDto(groupDto);
    } else {
      throw Exception("Group could not be joined");
    }
  }

  static Future<bool> leaveGroup(String groupId) async {
    try {
      await _membersApi.deleteMemberFromGroup(groupId, global.localData.userId);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String?> getGroupDescription(String groupId) async {
    String? description = await _groupsApi.getGroupDescription(groupId);

    if (description != null) {
      return description;
    } else {
      throw Exception("Group is private or does not exist");
    }
  }

  static Future<String?> getGroupLink(String groupId) async {
    String? link = await _groupsApi.getGroupLink(groupId);

    if (link != null) {
      return link;
    } else {
      throw Exception("Group is private or does not exist");
    }
  }

  static Future<String> getGroupAdmin(String groupId) async {
    String? admin = await _groupsApi.getGroupAdmin(groupId);

    if (admin != null) {
      return admin;
    } else {
      throw Exception("Group is private or does not exist");
    }
  }

  static Future<String> getInviteUrl(String groupId) async {
    String? inviteUrl = await _groupsApi.getGroupInviteUrl(groupId);

    if (inviteUrl != null) {
      return inviteUrl;
    } else {
      throw Exception("Group is private or does not exist");
    }
  }

  static Future<Uint8List> getProfileImage(Group group) async {
    final response  = await _groupsApi.getGroupProfileImageWithHttpInfo(group.groupId);

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception("Failed to load profile image");
    }
  }

  static Future<Uint8List> getPinImage(Group group) async {
    final response = await _groupsApi.getGroupPinImageWithHttpInfo(group.groupId);

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception("Failed to load pin image");
    }
  }
}
