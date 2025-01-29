// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 6;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      userId: fields[3] as String,
      username: fields[4] as String,
      selectedBatch: fields[5] as int?,
      description: fields[6] as String?,
      keepAlive: fields[2] as bool,
      hits: fields[1] as int,
      ttl: fields[0] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.username)
      ..writeByte(5)
      ..write(obj.selectedBatch)
      ..writeByte(6)
      ..write(obj.description)
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
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
