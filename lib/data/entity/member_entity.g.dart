// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemberEntityAdapter extends TypeAdapter<MemberEntity> {
  @override
  final typeId = 3;

  @override
  MemberEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemberEntity(
      userId: fields[0] as String,
      points: (fields[1] as num).toInt(),
      username: fields[2] as String,
      selectedBatch: (fields[3] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, MemberEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.points)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.selectedBatch);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MembersEntityAdapter extends TypeAdapter<MembersEntity> {
  @override
  final typeId = 4;

  @override
  MembersEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MembersEntity(
      members: (fields[3] as List).cast<MemberEntity>(),
      keepAlive: fields[2] == null ? false : fields[2] as bool,
      hits: fields[1] == null ? 1 : (fields[1] as num).toInt(),
      ttl: fields[0] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, MembersEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.ttl)
      ..writeByte(1)
      ..write(obj.hits)
      ..writeByte(2)
      ..write(obj.keepAlive)
      ..writeByte(3)
      ..write(obj.members);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MembersEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
