import 'dart:convert';
import 'dart:typed_data';

import 'package:drift/drift.dart';
import 'package:openapi/api.dart';

import '../entity/database.dart';

class LocalUserDto {
  final String userId;
  final String username;

  LocalUserDto({
    required this.userId,
    required this.username,
  });

  factory LocalUserDto.fromEntityData(UserEntityData entityData) {
    return LocalUserDto(
      userId: entityData.userId,
      username: entityData.username,
    );
  }

  UserEntityCompanion toCompanion() {
    return UserEntityCompanion(
      userId: Value(userId),
      username: Value(username),
    );
  }

  factory LocalUserDto.fromRanking(RankingResponseDto ranking) {
    return LocalUserDto(
      userId: ranking.userId,
      username: ranking.username,
    );
  }

  factory LocalUserDto.fromInfoDto(UserInfoDto info) {
    return LocalUserDto(
      userId: info.userId,
      username: info.username,
    );
  }

}