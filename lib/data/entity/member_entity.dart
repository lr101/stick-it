import 'package:drift/drift.dart';

class MemberEntity extends Table {
  TextColumn get groupId => text()();
  TextColumn get userId => text()();

  // Specify the primary key
  @override
  Set<Column> get primaryKey => {groupId, userId};
}
