import 'dart:convert';
import 'dart:typed_data';

import 'package:drift/drift.dart';
import 'package:openapi/api.dart';

import '../entity/database.dart';

class LocalUserDto {
  final String userId;
  final String username;
  Uint8List? profileImage;
  Uint8List? profileImageSmall;

  LocalUserDto({
    required this.userId,
    required this.username,
    this.profileImage,
    this.profileImageSmall,
  });

  factory LocalUserDto.fromEntityData(UserEntityData entityData) {
    return LocalUserDto(
      userId: entityData.userId,
      username: entityData.username,
      profileImage: entityData.profileImage,
      profileImageSmall: entityData.profileImageSmall,
    );
  }

  UserEntityCompanion toCompanion() {
    return UserEntityCompanion(
      userId: Value(userId),
      username: Value(username),
      profileImage: Value(profileImage),
      profileImageSmall: Value(profileImageSmall),
    );
  }

  factory LocalUserDto.fromRanking(RankingResponseDto ranking) {
    return LocalUserDto(
      userId: ranking.userId,
      username: ranking.username,
      profileImageSmall: ranking.profileImageSmall != null ? base64Decode(ranking.profileImageSmall!) : null,
    );
  }

  factory LocalUserDto.fromInfoDto(UserInfoDto info) {
    return LocalUserDto(
      userId: info.userId,
      username: info.username
    );
  }

}