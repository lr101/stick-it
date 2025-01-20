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
      groupId: fields[0] as String,
      name: fields[1] as String,
      visibility: fields[2] as int,
      inviteUrl: fields[3] as String?,
      groupAdmin: fields[4] as String?,
      description: fields[5] as String?,
      isActivated: fields[6] as bool,
      lastUpdated: fields[7] as DateTime?,
      link: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GroupEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.groupId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.visibility)
      ..writeByte(3)
      ..write(obj.inviteUrl)
      ..writeByte(4)
      ..write(obj.groupAdmin)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.isActivated)
      ..writeByte(7)
      ..write(obj.lastUpdated)
      ..writeByte(8)
      ..write(obj.link);
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
