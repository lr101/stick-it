import 'dart:convert';
import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:buff_lisa/data/entity/season_entity.dart';
import 'package:drift/drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/api.dart';

@immutable
class LocalGroupDto {

  final String groupId;
  final String name;
  final int visibility;
  final String? link;
  final String? inviteUrl;
  final String? groupAdmin;
  final String? description;
  final DateTime? lastUpdated;
  final bool isActivated;
  final SeasonItemDto? bestSeason;

  const LocalGroupDto({
    required this.groupId,
    required this.name,
    required this.visibility,
    this.link,
    this.inviteUrl,
    this.groupAdmin,
    this.description,
    this.lastUpdated,
    this.bestSeason,
    required this.isActivated,
  });

  factory LocalGroupDto.fromEntityData(GroupEntity entityData) {
    return LocalGroupDto(
      groupId: entityData.groupId,
      name: entityData.name,
      link: entityData.link,
      visibility: entityData.visibility,
      inviteUrl: entityData.inviteUrl,
      groupAdmin: entityData.groupAdmin,
      description: entityData.description,
      lastUpdated: entityData.lastUpdated,
      isActivated: entityData.isActivated,
      bestSeason: entityData.bestSeason?.toDto(),
    );
  }

  GroupEntity toEntity({bool keepAlive = false}) {
    return GroupEntity(
      groupId: groupId,
      name: name,
      link: link,
      visibility: visibility,
      inviteUrl: inviteUrl,
      groupAdmin: groupAdmin,
      description: description,
      lastUpdated: lastUpdated,
      isActivated: isActivated,
      keepAlive: keepAlive,
      bestSeason: bestSeason != null ? SeasonEntity.fromDto(bestSeason!) : null,
    );
  }

  factory LocalGroupDto.fromDto(GroupDto dto, {bool isActivated = false}) {
    return LocalGroupDto(
      groupId: dto.id,
      name:  dto.name,
      visibility: dto.visibility,
      inviteUrl: dto.inviteUrl,
      description: dto.description,
      groupAdmin:  dto.groupAdmin,
      link: dto.link,
      lastUpdated: dto.lastUpdated,
      isActivated: isActivated,
      bestSeason: dto.bestSeason,
    );
  }

  CreateGroupDto toCreateGroupDto(Uint8List image) {
    return CreateGroupDto(
      name: name,
      groupAdmin: groupAdmin!,
      description: description!,
      profileImage: base64Encode(image),
      visibility: visibility,
      link: link,
    );
  }

  UpdateGroupDto toUpdateGroupDto(Uint8List? image) {
    return UpdateGroupDto(
      name: name,
      description: description,
      profileImage: image != null ?base64Encode(image) : null,
      visibility: visibility,
      groupAdmin: groupAdmin,
      link: link,
    );
  }

  LocalGroupDto copyWith({
    String? groupId,
    String? name,
    int? visibility,
    String? link,
    String? inviteUrl,
    String? groupAdmin,
    String? description,
    DateTime? lastUpdated,
    bool? isActivated,
    SeasonItemDto? bestSeason,
  }) {
    return LocalGroupDto(
      groupId: groupId ?? this.groupId,
      name: name ?? this.name,
      visibility: visibility ?? this.visibility,
      link: link ?? this.link,
      inviteUrl: inviteUrl ?? this.inviteUrl,
      groupAdmin: groupAdmin ?? this.groupAdmin,
      description: description ?? this.description,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      isActivated: isActivated ?? this.isActivated,
      bestSeason: bestSeason ?? this.bestSeason,
    );
  }

}
