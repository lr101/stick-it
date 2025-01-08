import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:buff_lisa/data/entity/user_entity.dart';
import 'package:drift/drift.dart';

// Define the Drift table for PinDTO
class PinEntity extends Table {

  // Unique ID of the pin - Primary Key
  TextColumn get pinId => text()();
  // Latitude position of the pin
  RealColumn get latitude => real()();

  // Longitude position of the pin
  RealColumn get longitude => real()();

  // Date of creation of the pin
  DateTimeColumn get creationDate => dateTime()();

  // Pin description
  TextColumn get description => text().nullable()();

  // Username of the creator
  TextColumn get creator => text().references(UserEntity, #userId)();

  // Group ID the pin belongs to (foreign key)
  TextColumn get group => text().references(GroupEntity, #groupId)();

  BoolColumn get isHidden => boolean().withDefault(const Constant(false))();

  DateTimeColumn get lastSynced => dateTime().nullable()();

  // Specify the primary key
  @override
  Set<Column> get primaryKey => {pinId};
}
