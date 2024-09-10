import 'dart:convert';
import 'dart:typed_data';

import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:openapi/api.dart';

class MemberDto {
  final String userId;
  final String groupId;
  final String username;
  final int points;
  final bool admin;
  final Uint8List? profileImageSmall;

  MemberDto({required this.userId, required this.groupId, required this.username, required this.profileImageSmall, required this.admin, required this.points});

  factory MemberDto.fromRanking(RankingResponseDto ranking, LocalGroupDto group) {
    return MemberDto(
      userId: ranking.userId,
      username: ranking.username,
      groupId: group.groupId,
      admin: group.groupAdmin == ranking.userId,
      points: ranking.ranking,
      profileImageSmall: ranking.profileImageSmall != null ? base64Decode(ranking.profileImageSmall!) : null,
    );
  }
}