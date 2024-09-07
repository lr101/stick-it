import 'dart:convert';
import 'dart:typed_data';

import 'package:buff_lisa/data/entity/database.dart';
import 'package:drift/drift.dart';
import 'package:openapi/api.dart';

class LocalGroupDto {

  final String groupId;
  final String name;
  final int visibility;
  final String? link;
  final String? inviteUrl;
  final String? groupAdmin;
  final String? description;
  final Uint8List profileImage;
  final Uint8List pinImage;
  final DateTime? lastUpdated;
  final bool isActivated;

  LocalGroupDto({
    required this.groupId,
    required this.name,
    required this.visibility,
    this.link,
    this.inviteUrl,
    this.groupAdmin,
    this.description,
    required this.profileImage,
    required this.pinImage,
    this.lastUpdated,
    required this.isActivated
  });

  factory LocalGroupDto.fromEntityData(GroupEntityData entityData) {
    return LocalGroupDto(
      groupId: entityData.groupId,
      name: entityData.name,
      link: entityData.link,
      visibility: entityData.visibility,
      inviteUrl: entityData.inviteUrl,
      groupAdmin: entityData.groupAdmin,
      description: entityData.description,
      profileImage: entityData.profileImage,
      pinImage: entityData.pinImage,
      lastUpdated: entityData.lastUpdated,
      isActivated: entityData.isActivated
    );
  }

  GroupEntityCompanion toCompanion() {
    return GroupEntityCompanion(
      groupId: Value(groupId),
      name: Value(name),
      link: Value(link),
      visibility: Value(visibility),
      inviteUrl: Value(inviteUrl),
      groupAdmin: Value(groupAdmin),
      description: Value(description),
      profileImage: Value(profileImage),
      pinImage: Value(pinImage),
      lastUpdated: Value(lastUpdated),
      isActivated: Value(isActivated)
    );
  }

  factory LocalGroupDto.fromDto(GroupDto dto) {
    return LocalGroupDto(
        groupId: dto.id,
        name:  dto.name,
        visibility: dto.visibility.value,
        inviteUrl: dto.inviteUrl,
        description: dto.description,
        groupAdmin:  dto.groupAdmin,
        link: dto.link,
        profileImage: base64Decode(dto.profileImage!),
        pinImage:  base64Decode(dto.pinImage!),
        lastUpdated: dto.lastUpdated,
        isActivated: false
    );
  }

  CreateGroupDto toCreateGroupDto() {
    return CreateGroupDto(
      name: name,
      groupAdmin: groupAdmin!,
      description: description!,
      profileImage: base64Encode(profileImage),
      visibility: visibility == 0 ? Visibility.number0 : Visibility.number1,
      link: link!
    );
  }

  UpdateGroupDto toUpdateGroupDto() {
    return UpdateGroupDto(
      name: name,
      description: description,
      profileImage: base64Encode(profileImage),
      visibility: visibility == 0 ? Visibility.number0 : Visibility.number1,
      groupAdmin: groupAdmin,
      link: link
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
    Uint8List? profileImage,
    Uint8List? pinImage,
    DateTime? lastUpdated,
    bool? isActivated
  }) {
    return LocalGroupDto(
        groupId: groupId ?? this.groupId,
        name: name ?? this.name,
        visibility: visibility ?? this.visibility,
        link: link ?? this.link,
        inviteUrl: inviteUrl ?? this.inviteUrl,
        groupAdmin: groupAdmin ?? this.groupAdmin,
        description: description ?? this.description,
        profileImage: profileImage ?? this.profileImage,
        pinImage: pinImage ?? this.pinImage,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        isActivated: isActivated ?? this.isActivated
    );
  }

}