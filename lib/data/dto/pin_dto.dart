import 'dart:convert';
import 'package:buff_lisa/data/entity/database.dart';
import 'package:buff_lisa/data/repository/pin_image_repository.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';

class LocalPinDto {
  final String id;
  final double latitude;
  final double longitude;
  final DateTime creationDate;
  final String creatorId;
  final String groupId;
  final bool isHidden;
  final DateTime? lastSynced;
  final PinLikeDto? likes;

  LocalPinDto({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.creationDate,
    required this.creatorId,
    required this.groupId,
    required this.isHidden,
    this.lastSynced,
    this.likes
  });

  factory LocalPinDto.fromEntityData(PinEntityData entityData) {
    return LocalPinDto(
      id: entityData.pinId,
      latitude: entityData.latitude,
      longitude: entityData.longitude,
      creationDate: entityData.creationDate,
      creatorId: entityData.creator,
      groupId: entityData.group,
      lastSynced: entityData.lastSynced,
      isHidden: entityData.isHidden,
    );
  }

  PinEntityCompanion toEntityCompanion() {
    return PinEntityCompanion(
      pinId: Value(id),
      latitude: Value(latitude),
      longitude: Value(longitude),
      creationDate: Value(creationDate),
      creator: Value(creatorId),
      group: Value(groupId),
      isHidden: Value(isHidden),
      lastSynced: Value(lastSynced)
    );
  }

  factory LocalPinDto.fromDto(PinWithOptionalImageDto pinDto) {
    return LocalPinDto(
      latitude : pinDto.latitude.toDouble(),
      longitude : pinDto.longitude.toDouble(),
      id : pinDto.id,
      creatorId : pinDto.creationUser,
      creationDate : pinDto.creationDate,
      groupId: pinDto.groupId,
      isHidden: false,
      lastSynced: pinDto.creationDate, // TODO update to last updated
      likes: pinDto.likes
    );
  }

  factory LocalPinDto.fromDtoWithImage(PinWithOptionalImageDto pinDto) {
    return LocalPinDto(
      latitude : pinDto.latitude.toDouble(),
      longitude : pinDto.longitude.toDouble(),
      id : pinDto.id,
      creatorId : pinDto.creationUser,
      creationDate : pinDto.creationDate,
      groupId: pinDto.groupId,
      isHidden: false,
      lastSynced: pinDto.creationDate, // TODO update to last updated
      likes: pinDto.likes
    );
  }

  PinRequestDto toPinRequestDto(String image) {
    return PinRequestDto(
      latitude: latitude,
      longitude: longitude,
      groupId: groupId,
      creationDate: creationDate,
      image: image,
      userId: creatorId
    );
  }


}