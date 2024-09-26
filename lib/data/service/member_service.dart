import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/repository/user_repository.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/member_dto.dart';
import 'global_data_service.dart';

part 'member_service.g.dart';

@riverpod
class MemberService extends _$MemberService {

  @override
  Future<List<MemberDto>> build(String groupId) async {
    final bool isUserGroup = ref.watch(userGroupServiceProvider).value!.any((e) => e.groupId == groupId);
    if (isUserGroup) {
      final localMembers = await ref.watch(groupRepositoryProvider).getMembers(groupId);
      this.state = AsyncData(localMembers);
    }
    final memberApi = ref.watch(memberApiProvider);
    final members = await memberApi.getGroupRanking(groupId);
    if (isUserGroup) {
      ref.watch(groupRepositoryProvider).overrideMember(members!, groupId);
    }
    return members!.map((e) => MemberDto.fromRanking(e, groupId)).toList();
  }

}