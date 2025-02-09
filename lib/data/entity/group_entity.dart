import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:buff_lisa/data/entity/season_entity.dart';
import 'package:hive/hive.dart';
import 'package:openapi/api.dart';

part 'group_entity.g.dart'; // This will be generated

@HiveType(typeId: 1) // Unique type ID for this entity
class GroupEntity extends CacheEntity {

  @HiveField(3)
  final String groupId;

  @HiveField(4)
  final String name;

  @HiveField(5)
  final int visibility;

  @HiveField(6)
  final String? inviteUrl;

  @HiveField(7)
  final String? groupAdmin;

  @HiveField(8)
  final String? description;

  @HiveField(9)
  final bool isActivated;

  @HiveField(10)
  final DateTime? lastUpdated;

  @HiveField(11)
  final String? link;

  @HiveField(12)
  final SeasonEntity? bestSeason;

  GroupEntity({
    required this.groupId,
    required this.name,
    required this.visibility,
    this.inviteUrl,
    this.groupAdmin,
    this.description,
    this.isActivated = false,
    this.lastUpdated,
    this.link,
    this.bestSeason,
    super.keepAlive,
    super.hits,
    super.ttl,
  });
  
  factory GroupEntity.fromGroupDto(GroupDto groupDto, {bool keepAlive = false, bool isActivated = false}) {
    return GroupEntity(
      groupId: groupDto.id,
      name: groupDto.name,
      visibility: groupDto.visibility,
      isActivated: isActivated,
      description: groupDto.description,
      inviteUrl: groupDto.inviteUrl,
      groupAdmin: groupDto.groupAdmin,
      lastUpdated: groupDto.lastUpdated,
      bestSeason: groupDto.bestSeason == null ? null : SeasonEntity.fromDto(groupDto.bestSeason!),
      link: groupDto.link,
      keepAlive: keepAlive,
    );
  }

  @override
  GroupEntity copyWith({DateTime? ttl, int? hits, bool? keepAlive}) {
    return GroupEntity(
      groupId: groupId,
      name: name,
      visibility: visibility,
      description: description,
      inviteUrl: inviteUrl,
      groupAdmin: groupAdmin,
      lastUpdated: lastUpdated,
      isActivated: isActivated,
      link: link,
      bestSeason: bestSeason,
      keepAlive: keepAlive ?? this.keepAlive,
      hits: hits ?? this.hits,
      ttl: ttl,
    );
  }
}
