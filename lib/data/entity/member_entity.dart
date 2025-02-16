import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:openapi/api.dart';

part 'member_entity.g.dart'; // This will be generated

@HiveType(typeId: 3) // Unique type ID for this entity
class MemberEntity {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final int points;

  @HiveField(2)
  final String username;

  @HiveField(3)
  final int? selectedBatch;

  MemberEntity({
    required this.userId,
    required this.points,
    required this.username,
    required this.selectedBatch,
  });

  factory MemberEntity.fromRanking(MemberResponseDto memberDto) {
    return MemberEntity(userId: memberDto.userId, points: memberDto.ranking, username: memberDto.username, selectedBatch: memberDto.selectedBatch);
  }
}

@HiveType(typeId: 4)
class MembersEntity extends CacheEntity {
  @HiveField(3)
  final List<MemberEntity> members;

  MembersEntity({
    required this.members,
    super.keepAlive,
    super.hits,
    super.ttl,
  });

  @override
  CacheEntity copyWith({DateTime? ttl, int? hits, bool? keepAlive}) {
    return MembersEntity(
      members: members,
      ttl: ttl ?? this.ttl,
      hits: hits ?? this.hits,
      keepAlive: keepAlive ?? this.keepAlive,
    );
  }
}
