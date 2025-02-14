// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_like_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLikeEntityAdapter extends TypeAdapter<UserLikeEntity> {
  @override
  final int typeId = 7;

  @override
  UserLikeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLikeEntity(
      likeCount: (fields[3] as num).toInt(),
      likePhotographyCount: (fields[4] as num).toInt(),
      likeLocationCount: (fields[5] as num).toInt(),
      likeArtCount: (fields[6] as num).toInt(),
      hits: fields[1] == null ? 1 : (fields[1] as num).toInt(),
      ttl: fields[0] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserLikeEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.ttl)
      ..writeByte(1)
      ..write(obj.hits)
      ..writeByte(3)
      ..write(obj.likeCount)
      ..writeByte(4)
      ..write(obj.likePhotographyCount)
      ..writeByte(5)
      ..write(obj.likeLocationCount)
      ..writeByte(6)
      ..write(obj.likeArtCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLikeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
