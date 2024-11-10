import 'package:drift/drift.dart';

@TableIndex(name: 'user_username', columns: {#username})
class UserEntity extends Table {
  // Unique ID of the pin - Primary Key
  TextColumn get userId => text()();

  // Unique username
  TextColumn get username => text().unique()();

  // Specify the primary key
  @override
  Set<Column> get primaryKey => {userId};
}
