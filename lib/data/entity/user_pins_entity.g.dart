// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pins_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserPinsEntityAdapter extends TypeAdapter<UserPinsEntity> {
  @override
  final int typeId = 9;

  @override
  UserPinsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPinsEntity(
      pins: (fields[3] as List).cast<PinEntity>(),
      keepAlive: fields[2] as bool,
      hits: fields[1] as int,
      ttl: fields[0] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserPinsEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.pins)
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
      other is UserPinsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
