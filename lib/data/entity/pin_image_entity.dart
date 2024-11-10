import 'package:drift/drift.dart';

class PinImageEntity extends Table {
  BlobColumn get image => blob()();
  TextColumn get pinId => text()();
  IntColumn get hitCount => integer().withDefault(Constant(0))();
  DateTimeColumn get lastAccessed => dateTime().withDefault(Constant(DateTime.now()))();
  BoolColumn get keepAlive => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {pinId};
}
