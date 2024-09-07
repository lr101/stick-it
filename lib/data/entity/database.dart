import 'package:drift/drift.dart';

import 'package:drift_flutter/drift_flutter.dart' as connect;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'group_entity.dart';
import 'member_entity.dart';
import 'pin_entity.dart';
import 'user_entity.dart';

part 'database.g.dart';

@DriftDatabase(tables: [GroupEntity, PinEntity, UserEntity, MemberEntity])
class Database extends _$Database {

  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return connect.driftDatabase(name: 'local_pin_data');
  }
}

@Riverpod(keepAlive: true)
Database database(DatabaseRef ref) {
  return Database();
}