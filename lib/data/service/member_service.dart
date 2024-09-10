import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/member_dto.dart';

part 'member_service.g.dart';

@Riverpod(keepAlive: true)
class MemberService extends _$MemberService {

  @override
  Future<List<MemberDto>> build(String groupId) async {
    final memberApi = ref.watch(memberApiProvider);
    final group = ref.watch(groupByIdProvider(groupId)).value;

    final members = await memberApi.getGroupRanking(groupId);
    if (members != null && group != null) {
      return members.map((e) => MemberDto.fromRanking(e, group)).toList();
    }
    return [];
  }

}