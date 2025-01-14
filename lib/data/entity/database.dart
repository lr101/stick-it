import 'package:buff_lisa/data/entity/pin_image_entity.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift_flutter/drift_flutter.dart' as connect;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'group_entity.dart';
import 'group_image_entity.dart';
import 'member_entity.dart';
import 'pin_entity.dart';
import 'user_entity.dart';

part 'database.g.dart';

@DriftDatabase(tables: [GroupEntity, PinEntity, UserEntity, MemberEntity, PinImageEntity, GroupImageEntity])
class Database extends _$Database {

  Database() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  static QueryExecutor _openConnection() {
    return connect.driftDatabase(name: 'local_pin_data');
  }

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) {
      return m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from == 1) {
        await m.createTable(pinImageEntity);
      } else if (from == 2) {
        await m.addColumn(memberEntity, memberEntity.ranking);
      } else if (from == 3) {
        await m.addColumn(pinEntity, pinEntity.description);
      }
    },
  );
}

@Riverpod(keepAlive: true)
Database database(Ref ref) {
  return Database();
}