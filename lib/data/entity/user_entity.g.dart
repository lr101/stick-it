// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final typeId = 6;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      userId: fields[3] as String,
      username: fields[4] as String,
      selectedBatch: (fields[5] as num?)?.toInt(),
      description: fields[6] as String?,
      bestSeason: fields[7] as SeasonEntity?,
      keepAlive: fields[2] == null ? false : fields[2] as bool,
      hits: fields[1] == null ? 1 : (fields[1] as num).toInt(),
      ttl: fields[0] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.ttl)
      ..writeByte(1)
      ..write(obj.hits)
      ..writeByte(2)
      ..write(obj.keepAlive)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.username)
      ..writeByte(5)
      ..write(obj.selectedBatch)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.bestSeason);
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
