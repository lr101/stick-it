// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PinEntityAdapter extends TypeAdapter<PinEntity> {
  @override
  final int typeId = 5;

  @override
  PinEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PinEntity(
      pinId: fields[3] as String,
      latitude: fields[4] as double,
      longitude: fields[5] as double,
      creationDate: fields[6] as DateTime,
      description: fields[7] as String?,
      creator: fields[8] as String,
      group: fields[9] as String,
      isHidden: fields[10] as bool,
      lastSynced: fields[11] as DateTime?,
      keepAlive: fields[2] as bool,
      hits: fields[1] as int,
      ttl: fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, PinEntity obj) {
    writer
      ..writeByte(12)
      ..writeByte(3)
      ..write(obj.pinId)
      ..writeByte(4)
      ..write(obj.latitude)
      ..writeByte(5)
      ..write(obj.longitude)
      ..writeByte(6)
      ..write(obj.creationDate)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.creator)
      ..writeByte(9)
      ..write(obj.group)
      ..writeByte(10)
      ..write(obj.isHidden)
      ..writeByte(11)
      ..write(obj.lastSynced)
      ..writeByte(0)
      ..write(obj.ttl)
      ..writeByte(1)
      ..write(obj.hits)
      ..writeByte(2)
      ..write(obj.keepAlive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PinEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
