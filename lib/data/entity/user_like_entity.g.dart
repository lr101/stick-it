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
      likeCount: fields[3] as int,
      likePhotographyCount: fields[4] as int,
      likeLocationCount: fields[5] as int,
      likeArtCount: fields[6] as int,
      hits: fields[1] as int,
      ttl: fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, UserLikeEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(3)
      ..write(obj.likeCount)
      ..writeByte(4)
      ..write(obj.likePhotographyCount)
      ..writeByte(5)
      ..write(obj.likeLocationCount)
      ..writeByte(6)
      ..write(obj.likeArtCount)
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
      other is UserLikeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
