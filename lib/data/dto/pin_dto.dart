import 'dart:convert';
import 'package:buff_lisa/data/entity/database.dart';
import 'package:drift/drift.dart';
import 'package:openapi/api.dart';

class LocalPinDto {
  final String id;
  final double latitude;
  final double longitude;
  final DateTime creationDate;
  final String creatorId;
  final String groupId;
  final Uint8List? image;
  final bool isHidden;

  LocalPinDto({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.creationDate,
    required this.creatorId,
    required this.groupId,
    required this.isHidden,
    this.image,
  });

  factory LocalPinDto.fromEntityData(PinEntityData entityData) {
    return LocalPinDto(
      id: entityData.pinId,
      latitude: entityData.latitude,
      longitude: entityData.longitude,
      creationDate: entityData.creationDate,
      creatorId: entityData.creator,
      groupId: entityData.group,
      image: entityData.image,
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
      image: Value(image),
      isHidden: Value(isHidden),
    );
  }

  factory LocalPinDto.fromDto(PinWithoutImageDto pinDto) {
    return LocalPinDto(
      latitude : pinDto.latitude.toDouble(),
      longitude : pinDto.longitude.toDouble(),
      id : pinDto.id,
      creatorId : pinDto.creationUser,
      creationDate : pinDto.creationDate,
      groupId: pinDto.groupId,
      isHidden: false
    );
  }

  factory LocalPinDto.fromDtoWithImage(PinWithOptionalImageDto pinDto) {
    return LocalPinDto(
      latitude : pinDto.latitude.toDouble(),
      longitude : pinDto.longitude.toDouble(),
      id : pinDto.id,
      creatorId : pinDto.creationUser,
      creationDate : pinDto.creationDate!,
      image: pinDto.image != null ? base64Decode(pinDto.image!) : null,
      groupId: pinDto.groupId,
      isHidden: false
    );
  }

  PinRequestDto toPinRequestDto() {
    return PinRequestDto(
      latitude: latitude,
      longitude: longitude,
      groupId: groupId,
      image: base64Encode(image!.toList()),
      creationDate: creationDate,
      userId: creatorId
    );
  }


}