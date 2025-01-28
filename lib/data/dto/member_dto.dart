import 'package:buff_lisa/data/entity/member_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:openapi/api.dart';


@immutable
class MemberDto {
  final String userId;
  final String groupId;
  final String username;
  final int points;
  final int? selectedBatch;

  const MemberDto({required this.userId, required this.groupId, required this.username, required this.points, required this.selectedBatch});

  factory MemberDto.fromRanking(MemberResponseDto ranking, String groupId) {
    return MemberDto(
      userId: ranking.userId,
      username: ranking.username,
      groupId: groupId,
      points: ranking.ranking,
      selectedBatch: ranking.selectedBatch,
    );
  }

  factory MemberDto.fromEntity(MemberEntity memberEntity, String groupId) {
    return MemberDto(
        userId: memberEntity.userId,
        username: memberEntity.username,
        groupId: groupId,
        points: memberEntity.points,
        selectedBatch: memberEntity.selectedBatch,
    );
  }
}