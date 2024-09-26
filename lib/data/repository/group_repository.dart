import 'dart:convert';

import 'package:buff_lisa/data/dto/member_dto.dart';
import 'package:buff_lisa/data/dto/user_dto.dart';
import 'package:buff_lisa/data/entity/database.dart';
import 'package:drift/drift.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_repository.g.dart';

class GroupRepository {
  GroupRepository({required this.ref}) {
    _db = ref.watch(databaseProvider);
  }

  final Ref ref;

  late Database _db;

  // Create a new group
  Future<void> createGroup(LocalGroupDto group) async {
    await _db.into(_db.groupEntity).insertOnConflictUpdate(group.toCompanion());
  }

  // Get a group by its ID
  Future<LocalGroupDto?> getGroupById(String groupId) async {
    final groupRow = await (_db.select(_db.groupEntity)
          ..where((tbl) => tbl.groupId.equals(groupId)))
        .getSingleOrNull();
    if (groupRow == null) return null;
    return LocalGroupDto.fromEntityData(groupRow);
  }

  // Get all groups
  Future<List<LocalGroupDto>> getAllGroups() async {
    final groupRows = await (_db.select(_db.groupEntity)).get();
    return groupRows.map((e) => LocalGroupDto.fromEntityData(e)).toList();
  }

  Future<List<LocalGroupDto>> getActiveGroups() async {
    final groupRows = await (_db.select(_db.groupEntity)
          ..where((tbl) => tbl.isActivated.equals(true)))
        .get();
    return groupRows.map((e) => LocalGroupDto.fromEntityData(e)).toList();
  }

  // Delete a group and its associated pins
  Future<void> deleteGroup(String groupId) async {
    // First, delete all pins associated with the group
    await (_db.delete(_db.pinEntity)..where((tbl) => tbl.group.equals(groupId)))
        .go();
    // Then, delete the group itself
    await (_db.delete(_db.groupEntity)
          ..where((tbl) => tbl.groupId.equals(groupId)))
        .go();
    // Then, delete memberships
    await (_db.delete(_db.memberEntity)
          ..where((tbl) => tbl.groupId.equals(groupId)))
        .go();
  }

  Future<List<MemberDto>> getMembers(String groupId) async {
    final groupRow = await (_db.select(_db.memberEntity).join([
      innerJoin(_db.userEntity,
          _db.userEntity.userId.equalsExp(_db.memberEntity.userId))
    ])
          ..where(_db.memberEntity.groupId.equals(groupId)))
        .get();
    return groupRow
        .map((e) => MemberDto(
            userId: e.readTable(_db.userEntity).userId,
            groupId: groupId,
            username: e.readTable(_db.userEntity).username,
            profileImageSmall: e.readTable(_db.userEntity).profileImageSmall,
            points: e.readTable(_db.memberEntity).ranking))
        .toList();
  }

  Future<void> overrideMember(
      List<RankingResponseDto> member, String groupId) async {
    await _db.transaction(() async {
      await (_db.delete(_db.memberEntity)..where((d) => d.groupId.equals(groupId))).go();
      await (_db.batch((batch) => batch.insertAll(
          _db.memberEntity,
          member.map((e) => MemberEntityCompanion(
                userId: Value(e.userId),
                ranking: Value(e.ranking),
                groupId: Value(groupId),
              )))));
      await (_db.batch((batch) => batch.insertAllOnConflictUpdate(
          _db.userEntity,
          member.map((e) => UserEntityCompanion(
            userId: Value(e.userId),
            username: Value(e.username),
            profileImageSmall: Value(e.profileImageSmall != null ? base64Decode(e.profileImageSmall!): null)
          )))));
    });
  }
  
  Future<void> addPoint(String userId, String groupId) async {
    final entity = await (_db.select(_db.memberEntity)..where((e) => e.userId.equals(userId) & e.groupId.equals(groupId))).getSingle();
    await (_db.into(_db.memberEntity)).insertOnConflictUpdate(MemberEntityData(
        userId: userId,
        groupId: groupId,
        ranking: entity.ranking + 1
    ));
  }

  Future<void> removePoint(String userId, String groupId) async {
    final entity = await (_db.select(_db.memberEntity)..where((e) => e.userId.equals(userId) & e.groupId.equals(groupId))).getSingle();
    await (_db.into(_db.memberEntity)).insertOnConflictUpdate(MemberEntityData(
        userId: userId,
        groupId: groupId,
        ranking: entity.ranking - 1
    ));
  }

  Future<void> addMember(String userId, String groupId, int ranking) async {
    await (_db.into(_db.memberEntity).insertOnConflictUpdate(
        MemberEntityCompanion(
            userId: Value(userId),
            groupId: Value(groupId),
            ranking: Value(ranking))));
  }

  Future<void> leaveGroup(String groupId) async {
    await (_db.delete(_db.groupEntity)
          ..where((tbl) => tbl.groupId.equals(groupId)))
        .go();
  }
}

@Riverpod(keepAlive: true)
GroupRepository groupRepository(GroupRepositoryRef ref) {
  return GroupRepository(ref: ref);
}
