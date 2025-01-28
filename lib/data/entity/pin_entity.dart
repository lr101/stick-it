import 'dart:convert';
import 'dart:typed_data';

import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:hive/hive.dart';
import 'package:openapi/api.dart';

part 'pin_entity.g.dart'; // This will be generated

@HiveType(typeId: 5) // Unique type ID for this entity
class PinEntity extends CacheEntity {
  @HiveField(3)
  final String pinId;

  @HiveField(4)
  final double latitude;

  @HiveField(5)
  final double longitude;

  @HiveField(6)
  final DateTime creationDate;

  @HiveField(7)
  final String? description;

  @HiveField(8)
  final String creator; // Assuming this is a userId

  @HiveField(9)
  final String group; // Assuming this is a groupId

  @HiveField(10)
  final bool isHidden;

  @HiveField(11)
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
    super.keepAlive,
    super.hits,
    super.ttl,
  });

  factory PinEntity.fromDto(PinWithOptionalImageDto pinDto, {bool keepAlive = false}) {
    return PinEntity(
      pinId: pinDto.id,
      latitude: pinDto.latitude as double,
      longitude: pinDto.longitude as double,
      creationDate: pinDto.creationDate,
      creator: pinDto.creationUser,
      group: pinDto.groupId,
      description: pinDto.description,
      lastSynced: DateTime.now(),
      keepAlive: keepAlive,
    );
  }

  PinRequestDto toRequestDto(Uint8List image) {
    return PinRequestDto(image: base64Encode(image), latitude: latitude, longitude: longitude, userId: creator, groupId: group);
  }

  @override
  CacheEntity copyWith({DateTime? ttl, int? hits, bool? keepAlive}) {
    return PinEntity(
      pinId: pinId,
      latitude: latitude,
      longitude: longitude,
      creationDate: creationDate,
      description: description,
      creator: creator,
      group: group,
      isHidden: isHidden,
      lastSynced: lastSynced,
      hits: hits ?? this.hits,
      ttl: ttl ?? this.ttl,
      keepAlive: keepAlive ?? this.keepAlive,
    );
  }

}
