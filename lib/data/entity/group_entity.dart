import 'package:buff_lisa/data/entity/user_entity.dart';
import 'package:drift/drift.dart';

// Define the Drift table for GroupDTO
class GroupEntity extends Table {
  // Group Id - primary key
  TextColumn get groupId => text()();

  // Name of the group
  TextColumn get name => text()();

  // Visibility of the group
  IntColumn get visibility => integer()();

  // Invite URL (nullable)
  TextColumn get inviteUrl => text().nullable()();

  // Group admin (nullable)
  TextColumn get groupAdmin => text().references(UserEntity, #userId).nullable()();

  // Description of the group (nullable)
  TextColumn get description => text().nullable()();

  // Is the group activated?
  BoolColumn get isActivated => boolean().withDefault(const Constant(false))();

  // Last updated timestamp (nullable)
  DateTimeColumn get lastUpdated => dateTime().nullable()();

  TextColumn get link => text().nullable()();

  // Specify the primary key
  @override
  Set<Column> get primaryKey => {groupId};
}
