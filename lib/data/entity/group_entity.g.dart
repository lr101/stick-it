// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupEntityAdapter extends TypeAdapter<GroupEntity> {
  @override
  final int typeId = 1;

  @override
  GroupEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupEntity(
      groupId: fields[3] as String,
      name: fields[4] as String,
      visibility: fields[5] as int,
      inviteUrl: fields[6] as String?,
      groupAdmin: fields[7] as String?,
      description: fields[8] as String?,
      isActivated: fields[9] as bool,
      lastUpdated: fields[10] as DateTime?,
      link: fields[11] as String?,
      bestSeason: fields[12] as SeasonEntity?,
      keepAlive: fields[2] as bool,
      hits: fields[1] as int,
      ttl: fields[0] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, GroupEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(3)
      ..write(obj.groupId)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.visibility)
      ..writeByte(6)
      ..write(obj.inviteUrl)
      ..writeByte(7)
      ..write(obj.groupAdmin)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.isActivated)
      ..writeByte(10)
      ..write(obj.lastUpdated)
      ..writeByte(11)
      ..write(obj.link)
      ..writeByte(12)
      ..write(obj.bestSeason)
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
      other is GroupEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
