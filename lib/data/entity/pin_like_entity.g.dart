// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_like_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PinLikeEntityAdapter extends TypeAdapter<PinLikeEntity> {
  @override
  final typeId = 8;

  @override
  PinLikeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PinLikeEntity(
      likeCount: (fields[3] as num).toInt(),
      likePhotographyCount: (fields[4] as num).toInt(),
      likeLocationCount: (fields[5] as num).toInt(),
      likeArtCount: (fields[6] as num).toInt(),
      hasLikeArt: fields[10] as bool,
      hasLike: fields[7] as bool,
      hasLikeLocation: fields[9] as bool,
      hasLikePhotography: fields[8] as bool,
      hits: fields[1] == null ? 1 : (fields[1] as num).toInt(),
      ttl: fields[0] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, PinLikeEntity obj) {
    writer
      ..writeByte(10)
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
      ..write(obj.likeArtCount)
      ..writeByte(7)
      ..write(obj.hasLike)
      ..writeByte(8)
      ..write(obj.hasLikePhotography)
      ..writeByte(9)
      ..write(obj.hasLikeLocation)
      ..writeByte(10)
      ..write(obj.hasLikeArt);
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
