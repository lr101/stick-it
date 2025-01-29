
import 'package:buff_lisa/data/entity/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:openapi/api.dart';

@immutable
class LocalUserDto {
  final String username;
  final String userId;
  final String? description;
  final UserLikesDto? likes;
  final int? selectedBatch;
  const LocalUserDto({required this.username, required this.userId, required this.description, this.likes, required this.selectedBatch});

  factory LocalUserDto.fromInfoDto(UserInfoDto user) {
    return LocalUserDto(
        username: user.username, userId: user.userId, description: user.description, selectedBatch: user.selectedBatch,);
  }

  LocalUserDto fromCurrentWithLikes(UserLikesDto likes) {
    return LocalUserDto(username: username, userId: userId, description: description, likes: likes, selectedBatch: selectedBatch);
  }

  factory LocalUserDto.fromEntity(UserEntity entity) {
    return LocalUserDto(
        username: entity.username, userId: entity.userId, description: entity.description, selectedBatch: entity.selectedBatch,);
  }
}
