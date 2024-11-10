import 'package:drift/drift.dart';

class GroupImageEntity extends Table {
  BlobColumn get profileImage =>  blob()();
  BlobColumn get profileImageSmall => blob().nullable()();
  BlobColumn get pinImage => blob()();
  TextColumn get groupId => text()();

  @override
  Set<Column> get primaryKey => {groupId};
}
