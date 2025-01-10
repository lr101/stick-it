import 'dart:convert';

import 'package:buff_lisa/data/entity/database.dart';
import 'package:drift/drift.dart';
import 'package:openapi/api.dart';

class   LocalGroupDto {

  String groupId;
  String name;
  int visibility;
  String? link;
  String? inviteUrl;
  String? groupAdmin;
  String? description;
  DateTime? lastUpdated;
  bool isActivated;

  LocalGroupDto({
    required this.groupId,
    required this.name,
    required this.visibility,
    this.link,
    this.inviteUrl,
    this.groupAdmin,
    this.description,
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
      lastUpdated: Value(lastUpdated),
      isActivated: Value(isActivated)
    );
  }

  factory LocalGroupDto.fromDto(GroupDto dto) {
    return LocalGroupDto(
        groupId: dto.id,
        name:  dto.name,
        visibility: dto.visibility,
        inviteUrl: dto.inviteUrl,
        description: dto.description,
        groupAdmin:  dto.groupAdmin,
        link: dto.link,
        lastUpdated: dto.lastUpdated,
        isActivated: false
    );
  }

  CreateGroupDto toCreateGroupDto(Uint8List image) {
    return CreateGroupDto(
      name: name,
      groupAdmin: groupAdmin!,
      description: description!,
      profileImage: base64Encode(image),
      visibility: visibility,
      link: link!
    );
  }

  UpdateGroupDto toUpdateGroupDto(Uint8List? image) {
    return UpdateGroupDto(
      name: name,
      description: description,
      profileImage: image != null ?base64Encode(image) : null,
      visibility: this.visibility,
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
        lastUpdated: lastUpdated ?? this.lastUpdated,
        isActivated: isActivated ?? this.isActivated
    );
  }

}