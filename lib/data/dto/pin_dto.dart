
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:openapi/api.dart';

@immutable
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
  final String? description;

  const LocalPinDto({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.creationDate,
    required this.creatorId,
    required this.groupId,
    required this.isHidden,
    required this.description,
    this.lastSynced,
    this.likes,
  });

  factory LocalPinDto.fromEntityData(PinEntity entityData) {
    return LocalPinDto(
      id: entityData.pinId,
      latitude: entityData.latitude,
      longitude: entityData.longitude,
      creationDate: entityData.creationDate,
      creatorId: entityData.creator,
      groupId: entityData.group,
      description: entityData.description,
      lastSynced: entityData.lastSynced,
      isHidden: entityData.isHidden,
    );
  }

  PinEntity toEntityCompanion({bool keepAlive = false}) {
    return PinEntity(
      pinId: id,
      latitude: latitude,
      longitude: longitude,
      creationDate: creationDate,
      creator: creatorId,
      group: groupId,
      isHidden: isHidden,
      description: description,
      lastSynced: lastSynced,
      keepAlive: keepAlive,
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
      description: pinDto.description,
      isHidden: false,
      lastSynced: pinDto.creationDate,
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
      description: pinDto.description,
      isHidden: false,
      lastSynced: pinDto.creationDate,
    );
  }

  PinRequestDto toPinRequestDto(String image) {
    return PinRequestDto(
      latitude: latitude,
      longitude: longitude,
      groupId: groupId,
      creationDate: creationDate,
      image: image,
      description: description,
      userId: creatorId,
    );
  }


}