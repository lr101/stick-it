
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/entity/database.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/user_dto.dart';

part 'user_repository.g.dart';

class UserRepository {

  UserRepository({required this.ref}) {
    _db = ref.watch(databaseProvider);
  }

  final Ref ref;

  late Database _db;

  Future<void> createUser(LocalUserDto user) async {
    await _db.into(_db.userEntity).insertOnConflictUpdate(user.toCompanion());
  }

  Future<LocalUserDto?> getUserById(String userId) async {
    final userEntity = await (_db.select(_db.userEntity)..where((tbl) => tbl.userId.equals(userId))).getSingleOrNull();
    if (userEntity == null) return null;
    return LocalUserDto.fromEntityData(userEntity);
  }



}

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) => UserRepository(ref: ref);