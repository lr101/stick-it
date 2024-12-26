import 'package:openapi/api.dart';

class MemberDto {
  final String userId;
  final String groupId;
  final String username;
  final int points;
  final int? selectedBatch;

  MemberDto({required this.userId, required this.groupId, required this.username, required this.points, required this.selectedBatch});

  factory MemberDto.fromRanking(MemberResponseDto ranking, String groupId) {
    return MemberDto(
      userId: ranking.userId,
      username: ranking.username,
      groupId: groupId,
      points: ranking.ranking,
      selectedBatch: ranking.selectedBatch
    );
  }
}