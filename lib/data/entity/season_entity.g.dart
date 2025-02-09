// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeasonEntityAdapter extends TypeAdapter<SeasonEntity> {
  @override
  final int typeId = 10;

  @override
  SeasonEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeasonEntity(
      id: fields[0] as String,
      seasonId: fields[1] as String,
      month: fields[2] as int,
      year: fields[3] as int,
      seasonNumber: fields[4] as int,
      rank: fields[5] as int,
      points: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SeasonEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.seasonId)
      ..writeByte(2)
      ..write(obj.month)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.seasonNumber)
      ..writeByte(5)
      ..write(obj.rank)
      ..writeByte(6)
      ..write(obj.points);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeasonEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
