import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/member_dto.dart';

part 'member_service.g.dart';

@riverpod
class MemberService extends _$MemberService {

  @override
  Future<List<MemberDto>> build(String groupId) async {
    final bool isUserGroup = await ref.watch(userGroupServiceProvider.selectAsync((e) => e.any((f) => f.groupId == groupId)));
    if (isUserGroup) {
      final localMembers = await ref.watch(groupRepositoryProvider).getMembers(groupId);
      if (localMembers.isEmpty) {
        this.state = const AsyncLoading();
      }
      this.state = AsyncData(localMembers);
    }
    final memberApi = ref.watch(memberApiProvider);
    final members = await memberApi.getGroupMembers(groupId);
    if (isUserGroup) {
      ref.watch(groupRepositoryProvider).overrideMember(members!, groupId);
    }
    return members!.map((e) => MemberDto.fromRanking(e, groupId)).toList();
  }

}