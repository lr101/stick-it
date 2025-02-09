import 'package:hive/hive.dart';
import 'package:openapi/api.dart';

part 'season_entity.g.dart';

@HiveType(typeId: 10)
class SeasonEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String seasonId;
  @HiveField(2)
  final int month;
  @HiveField(3)
  final int year;
  @HiveField(4)
  final int seasonNumber;
  @HiveField(5)
  final int rank;
  @HiveField(6)
  final int points;

  SeasonEntity(
      {required this.id,
      required this.seasonId,
      required this.month,
      required this.year,
      required this.seasonNumber,
      required this.rank,
      required this.points,});

  factory SeasonEntity.fromDto(SeasonItemDto dto) {
    return SeasonEntity(
      id: dto.id,
      seasonId: dto.season.id,
      month: dto.season.month,
      year: dto.season.year,
      seasonNumber: dto.season.seasonNumber,
      rank: dto.rank,
      points: dto.points,
    );
  }

  SeasonItemDto toDto() {
    return SeasonItemDto(id: id, season: SeasonDto(id: seasonId, month: month, year: year, seasonNumber: seasonNumber), points: points, rank: rank);
  }
}
