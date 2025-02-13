// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageEntityAdapter extends TypeAdapter<ImageEntity> {
  @override
  final int typeId = 2;

  @override
  ImageEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageEntity(
      filePath: fields[3] as String,
      keepAlive: fields[2] as bool,
      hits: fields[1] as int,
      ttl: fields[0] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.filePath)
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
      other is ImageEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
