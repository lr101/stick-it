
import 'package:buff_lisa/data/repository/pin_image_repository.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/pin_dto.dart';
import '../entity/database.dart';

part 'pin_repository.g.dart';

class PinRepository {

  PinRepository({required this.ref}) {
    _db = ref.watch(databaseProvider);
  }

  final Ref ref;

  late Database _db;

  Future<void> createOrUpdate(LocalPinDto pin) async {
    await _db.into(_db.pinEntity).insertOnConflictUpdate(pin.toEntityCompanion());
  }

  Future<List<LocalPinDto>> getAllPins() async {
    final pinRows = await (_db.select(_db.pinEntity)).get();
    return pinRows.map((e) => LocalPinDto.fromEntityData(e)).toList();
  }

  Future<List<LocalPinDto>> getPinsOfGroup(String groupId) async {
    final pinRows = await (
        _db.select(_db.pinEntity)
            .join([
          innerJoin(
              _db.groupEntity,
              _db.groupEntity.groupId.equalsExp(_db.pinEntity.group)
          )
        ])
          ..where(_db.pinEntity.group.equals(groupId))).get();
    return pinRows.map((e) => LocalPinDto.fromEntityData(e.readTable(_db.pinEntity))).toList();
  }

  Future<List<LocalPinDto>> getPinsOActiveGroup() async {
    final pinRows = await (
        _db.select(_db.pinEntity)
            .join([
          innerJoin(
              _db.groupEntity,
              _db.groupEntity.groupId.equalsExp(_db.pinEntity.group)
          )
        ])
          ..where(_db.groupEntity.isActivated.equals(true))).get();
    return pinRows.map((e) => LocalPinDto.fromEntityData(e.readTable(_db.pinEntity))).toList();
  }

  Future<LocalPinDto?> getPinById(String pinId) async {
    final pinRow = await (_db.select(_db.pinEntity)..where((tbl) => tbl.pinId.equals(pinId))).getSingleOrNull();
    if (pinRow == null) return null;
    return LocalPinDto.fromEntityData(pinRow);
  }

  Future<void> deletePinFromGroup(String pinId) async {
    await _db.transaction(() async {
      await (_db.delete(_db.pinEntity)
        ..where((tbl) => tbl.pinId.equals(pinId))).go();
      await (_db.delete(_db.pinImageEntity)..where((tbl) => tbl.pinId.equals(pinId))).go();
    });
  }

  Future<void> updateToSynced(LocalPinDto pin, String oldPinId, Uint8List image) async {
    await _db.transaction(() async {
      await (_db.delete(_db.pinEntity)..where((tbl) => tbl.pinId.equals(oldPinId))).go();
      await (_db.delete(_db.pinImageEntity)..where((tbl) => tbl.pinId.equals(oldPinId))).go();
      await (_db.into(_db.pinEntity)).insert(pin.toEntityCompanion());
      await (_db.into(_db.pinImageEntity)).insert(PinImageEntityCompanion(
        pinId: Value(pin.id),
        keepAlive: Value(false),
        image: Value(image),
        lastAccessed: Value(DateTime.now()),
      ));
    });
  }

  Future<List<LocalPinDto>> getAllNotSyncedPins() async {
    final pinRows = await (_db.select(_db.pinEntity)..where((tbl) => tbl.lastSynced.isNull())).get();
    return pinRows.map((e) => LocalPinDto.fromEntityData(e)).toList();
  }

}

@Riverpod(keepAlive: true)
PinRepository pinRepository(PinRepositoryRef ref) {
  return PinRepository(ref: ref);
}
