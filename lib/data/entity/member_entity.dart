import 'package:hive/hive.dart';

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
    required this.selectedBatch
  });
}

@HiveType(typeId: 4) // Unique type ID for this entity
class MembersEntity {
  @HiveField(0)
  final List<MemberEntity> members;

  MembersEntity({
    required this.members,
  });
}