import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/member_dto.dart';
import 'global_data_service.dart';

part 'member_service.g.dart';

@Riverpod(keepAlive: true)
class MemberService extends _$MemberService {

  @override
  Future<List<MemberDto>> build(LocalGroupDto group) async {
    final memberApi = ref.watch(memberApiProvider);
    final members = await memberApi.getGroupRanking(group.groupId);
    if (members != null) {
      return members.map((e) => MemberDto.fromRanking(e, group)).toList();
    }
    return [];
  }

  void addPoint() async {
    if (state.value == null) return;
    final currentState = state.value!;
    final userId = ref.watch(globalDataServiceProvider).userId!;
    final index = currentState.indexWhere((e) => e.userId == userId);
    final dto = currentState[index];
    currentState[index] = MemberDto(
      userId: userId,
      profileImageSmall: dto.profileImageSmall,
      username: dto.username,
      groupId: dto.groupId,
      admin: dto.admin,
      points: dto.points + 1
    );
    currentState.sort((e1, e2) => e2.points.compareTo(e1.points));
    state = AsyncValue.data(currentState);
  }

  void removePoint(String userId) async {
    final currentState = state.value ?? [];
    final index = currentState.indexWhere((e) => e.userId == userId);
    final dto = currentState[index];
    currentState[index] = MemberDto(
      userId: userId,
      profileImageSmall: dto.profileImageSmall,
      username: dto.username,
      groupId: dto.groupId,
      admin: dto.admin,
      points: dto.points - 1
    );
    currentState.sort((e1, e2) => e2.points.compareTo(e1.points));
    state = AsyncValue.data(currentState);
  }

}