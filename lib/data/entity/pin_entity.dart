import 'dart:convert';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:buff_lisa/data/entity/user_entity.dart';
import 'package:openapi/api.dart';

part 'pin_entity.g.dart'; // This will be generated

@HiveType(typeId: 5) // Unique type ID for this entity
class PinEntity {
  @HiveField(0)
  final String pinId;

  @HiveField(1)
  final double latitude;

  @HiveField(2)
  final double longitude;

  @HiveField(3)
  final DateTime creationDate;

  @HiveField(4)
  final String? description;

  @HiveField(5)
  final String creator; // Assuming this is a userId

  @HiveField(6)
  final String group; // Assuming this is a groupId

  @HiveField(7)
  final bool isHidden;

  @HiveField(8)
  final DateTime? lastSynced;

  PinEntity({
    required this.pinId,
    required this.latitude,
    required this.longitude,
    required this.creationDate,
    this.description,
    required this.creator,
    required this.group,
    this.isHidden = false,
    this.lastSynced,
  });

  factory PinEntity.fromDto(PinWithOptionalImageDto pinDto) {
    return PinEntity(
        pinId: pinDto.id,
        latitude: pinDto.latitude as double,
        longitude: pinDto.longitude as double,
        creationDate: pinDto.creationDate,
        creator: pinDto.creationUser,
        group: pinDto.groupId,
        description: pinDto.description,
        lastSynced: DateTime.now()
    );
  }

  PinRequestDto toRequestDto(Uint8List image) {
    return PinRequestDto(image: base64Encode(image), latitude: latitude, longitude: longitude, userId: creator, groupId: group);
  }

}
