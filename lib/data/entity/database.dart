import 'package:buff_lisa/data/entity/pin_image_entity.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:drift_flutter/drift_flutter.dart' as connect;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'group_entity.dart';
import 'member_entity.dart';
import 'pin_entity.dart';
import 'user_entity.dart';

part 'database.g.dart';

@DriftDatabase(tables: [GroupEntity, PinEntity, UserEntity, MemberEntity, PinImageEntity])
class Database extends _$Database {

  Database() : super(_openConnection());

  @override
  int get schemaVersion => 3;

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
      }
    },
  );
}

@Riverpod(keepAlive: true)
Database database(DatabaseRef ref) {
  return Database();
}