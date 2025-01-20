import 'package:hive/hive.dart';

part 'user_entity.g.dart'; // This will be generated

@HiveType(typeId: 6) // Unique type ID for this entity
class UserEntity {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final int? selectedBatch;

  UserEntity({
    required this.userId,
    required this.username,
    this.selectedBatch,
  });
}
