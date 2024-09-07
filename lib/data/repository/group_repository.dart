
import 'package:buff_lisa/data/dto/user_dto.dart';
import 'package:buff_lisa/data/entity/database.dart';
import 'package:drift/drift.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final groupRow = await (_db.select(_db.groupEntity)..where((tbl) => tbl.groupId.equals(groupId))).getSingleOrNull();
    if (groupRow == null) return null;
    return LocalGroupDto.fromEntityData(groupRow);
  }

  // Get all groups
  Future<List<LocalGroupDto>> getAllGroups() async {
    final groupRows = await (_db.select(_db.groupEntity)).get();
    return groupRows.map((e) => LocalGroupDto.fromEntityData(e)).toList();
  }

  Future<List<LocalGroupDto>> getActiveGroups() async {
    final groupRows = await (_db.select(_db.groupEntity)..where((tbl) => tbl.isActivated.equals(true))).get();
    return groupRows.map((e) => LocalGroupDto.fromEntityData(e)).toList();
  }

  // Delete a group and its associated pins
  Future<void> deleteGroup(String groupId) async {
    // First, delete all pins associated with the group
    await (_db.delete(_db.pinEntity)..where((tbl) => tbl.group.equals(groupId))).go();
    // Then, delete the group itself
    await (_db.delete(_db.groupEntity)..where((tbl) => tbl.groupId.equals(groupId))).go();
    // Then, delete memberships
    await (_db.delete(_db.memberEntity)..where((tbl) => tbl.groupId.equals(groupId))).go();
  }

  Future<List<LocalUserDto>> getMembers(String groupId) async {
    final groupRow = await (_db.select(_db.memberEntity)
      .join([
          innerJoin(
            _db.userEntity,
            _db.userEntity.userId.equalsExp(_db.memberEntity.userId)
          )
    ])..where(_db.memberEntity.groupId.equals(groupId))).get();
    return groupRow.map((e) => LocalUserDto.fromEntityData(e.readTable(_db.userEntity))).toList();
  }

  Future<void> addMember(String userId, String groupId) async {
    await (_db.into(_db.memberEntity).insertOnConflictUpdate(MemberEntityCompanion(
      userId: Value(userId),
      groupId: Value(groupId),
    )));
  }

  Future<void> leaveGroup(String groupId) async {
    await (_db.delete(_db.memberEntity)..where((tbl) => tbl.groupId.equals(groupId))).go();
  }

}

@Riverpod(keepAlive: true)
GroupRepository groupRepository(GroupRepositoryRef ref) {
  return GroupRepository(ref: ref);
}
