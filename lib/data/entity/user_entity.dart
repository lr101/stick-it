import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:buff_lisa/data/entity/season_entity.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:openapi/api.dart';

part 'user_entity.g.dart'; // This will be generated

@HiveType(typeId: 6) // Unique type ID for this entity
class UserEntity extends CacheEntity {
  @HiveField(3)
  final String userId;

  @HiveField(4)
  final String username;

  @HiveField(5)
  final int? selectedBatch;

  @HiveField(6)
  final String? description;

  @HiveField(7)
  final SeasonEntity? bestSeason;

  UserEntity({
    required this.userId,
    required this.username,
    this.selectedBatch,
    this.description,
    this.bestSeason,
    super.keepAlive,
    super.hits,
    super.ttl,
  });

  factory UserEntity.fromDto(UserInfoDto user, {bool keepAlive = false}) {
    return UserEntity(
      userId: user.userId,
      username: user.username,
      selectedBatch: user.selectedBatch,
      description: user.description,
      bestSeason: user.bestSeason == null ? null : SeasonEntity.fromDto(user.bestSeason!),
      keepAlive: keepAlive,
    );
  }

  UserEntity copyUserWith(UserUpdateResponseDto userDto, int? selectedBatch) {
    return UserEntity(
      userId: userId,
      username: userDto.userInfoDto!.username,
      selectedBatch: selectedBatch ?? this.selectedBatch,
      description: userDto.userInfoDto!.description ?? description,
      bestSeason: userDto.userInfoDto!.bestSeason == null ? bestSeason : SeasonEntity.fromDto(userDto.userInfoDto!.bestSeason!),
      keepAlive: keepAlive,
      ttl: ttl,
      hits: hits,
    );
  }

  @override
  CacheEntity copyWith({DateTime? ttl, int? hits, bool?keepAlive}) {
    return UserEntity(
      userId: userId,
      username: username,
      selectedBatch: selectedBatch,
      description: description,
      bestSeason: bestSeason,
      keepAlive: keepAlive ?? this.keepAlive,
      ttl: ttl ?? this.ttl,
      hits: hits ?? this.hits,
    );
  }

}
