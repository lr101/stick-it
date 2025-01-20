import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/member_entity.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/repository/member_repository.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/member_dto.dart';

part 'member_service.g.dart';

@riverpod
class MemberService extends _$MemberService {

  @override
  Future<List<MemberDto>> build(String groupId) async {
    final repo = ref.watch(memberRepositoryProvider);
    final preLoadedMembers = await repo.get(groupId);
    if (preLoadedMembers != null) {
      final convertedMembers = preLoadedMembers.members.map((e) =>
          MemberDto(
              userId: e.userId,
              groupId: groupId,
              username: e.username,
              points: e.points,
              selectedBatch: e.selectedBatch
          )).toList();
      convertedMembers.sort((a,b) => a.points - b.points);
      state = AsyncData(convertedMembers);
    }
    final memberApi = ref.watch(memberApiProvider);
    final members = await memberApi.getGroupMembers(groupId);
    await repo.deleteAll();
    final entity = MembersEntity(
        members: members!.map((e) => MemberEntity(
            userId: e.userId,
            points: e.ranking,
            username: e.username,
            selectedBatch: e.selectedBatch
        )).toList());
    repo.put(groupId, entity);
    return members.map((e) => MemberDto.fromRanking(e, groupId)).toList();
  }

}