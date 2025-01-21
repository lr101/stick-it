import 'package:hive/hive.dart';
import 'package:buff_lisa/data/entity/user_entity.dart';
import 'package:openapi/api.dart';

import 'cache_entity.dart';

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
  final String? groupAdmin; // Assuming this is a userId

  @HiveField(8)
  final String? description;

  @HiveField(9)
  final bool isActivated;

  @HiveField(10)
  final DateTime? lastUpdated;

  @HiveField(11)
  final String? link;

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
    super.keepAlive
  });
  
  factory GroupEntity.fromGroupDto(GroupDto groupDto) {
    return GroupEntity(
        groupId: groupDto.id, 
        name: groupDto.name, 
        visibility: groupDto.visibility,
        isActivated: false,
        description: groupDto.description,
        inviteUrl: groupDto.inviteUrl,
        groupAdmin: groupDto.groupAdmin,
        lastUpdated: groupDto.lastUpdated,
        link: groupDto.link
    );
  }
}
