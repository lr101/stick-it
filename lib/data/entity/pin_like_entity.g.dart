// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_like_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PinLikeEntityAdapter extends TypeAdapter<PinLikeEntity> {
  @override
  final int typeId = 8;

  @override
  PinLikeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PinLikeEntity(
      likeCount: fields[3] as int,
      likePhotographyCount: fields[4] as int,
      likeLocationCount: fields[5] as int,
      likeArtCount: fields[6] as int,
      hasLikeArt: fields[10] as bool,
      hasLike: fields[7] as bool,
      hasLikeLocation: fields[9] as bool,
      hasLikePhotography: fields[8] as bool,
      hits: fields[1] as int,
      ttl: fields[0] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, PinLikeEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(3)
      ..write(obj.likeCount)
      ..writeByte(4)
      ..write(obj.likePhotographyCount)
      ..writeByte(5)
      ..write(obj.likeLocationCount)
      ..writeByte(6)
      ..write(obj.likeArtCount)
      ..writeByte(7)
      ..write(obj.hasLike)
      ..writeByte(8)
      ..write(obj.hasLikePhotography)
      ..writeByte(9)
      ..write(obj.hasLikeLocation)
      ..writeByte(10)
      ..write(obj.hasLikeArt)
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
      other is PinLikeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
