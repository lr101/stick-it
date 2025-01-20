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
      pinId: fields[0] as String,
      latitude: fields[1] as double,
      longitude: fields[2] as double,
      creationDate: fields[3] as DateTime,
      description: fields[4] as String?,
      creator: fields[5] as String,
      group: fields[6] as String,
      isHidden: fields[7] as bool,
      lastSynced: fields[8] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, PinEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.pinId)
      ..writeByte(1)
      ..write(obj.latitude)
      ..writeByte(2)
      ..write(obj.longitude)
      ..writeByte(3)
      ..write(obj.creationDate)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.creator)
      ..writeByte(6)
      ..write(obj.group)
      ..writeByte(7)
      ..write(obj.isHidden)
      ..writeByte(8)
      ..write(obj.lastSynced);
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
