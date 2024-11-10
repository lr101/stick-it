import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/dto/user_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'no_user_group_service.g.dart';

@Riverpod(keepAlive: true)
class NoUserGroupService extends _$NoUserGroupService {


  @override
  Future<LocalGroupDto> build(String groupId) async {
    final groupApi = ref.watch(groupApiProvider);
    final group = await groupApi.getGroup(groupId);
    if (group != null) {
      final pinImage = await http.get(Uri.parse(group.pinImage!));
      final groupProfileImage = await http.get(Uri.parse(group.profileImage!));
      return LocalGroupDto.fromDto(group, groupProfileImage.bodyBytes, pinImage.bodyBytes);
    } else {
      throw Exception("Group not found");
    }
  }
}