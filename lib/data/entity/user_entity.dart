import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:hive/hive.dart';
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

  UserEntity({
    required this.userId,
    required this.username,
    this.selectedBatch,
    this.description,
    super.keepAlive
  });

  factory UserEntity.fromDto(UserInfoDto user, {bool keepAlive = false}) {
    return UserEntity(
      userId: user.userId,
      username: user.username,
      selectedBatch: user.selectedBatch,
      description: user.description,
      keepAlive: keepAlive
    );
  }

  UserEntity copyWith(UserUpdateResponseDto userDto, int? selectedBatch) {
    return UserEntity(
      userId: userId,
      username: userDto.username ?? username,
      selectedBatch: selectedBatch ?? this.selectedBatch,
      description: userDto.description ?? description,
      keepAlive: keepAlive,
    );
  }


}
