import 'package:openapi/api.dart';

class Ranking {

  /// Username of the user [key]
  String username;

  /// points = number of post of the user [value]
  int points;

  String userId;

  /// Constructor
  Ranking( {
    required this.username,
    required this.points,
    required this.userId
  });

  Ranking.fromDto(RankingResponseDto dto)
      : username = dto.username,
        points = dto.ranking,
        userId = dto.userId;

  /// adds a point to the points when the user creates a new pin
  addOnePoint() {
    points++;
  }

  subOnePoint() {
    points--;
  }
}