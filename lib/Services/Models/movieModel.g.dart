// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieModelAdapter extends TypeAdapter<MovieModel> {
  @override
  final int typeId = 0;

  @override
  MovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieModel(
      movieTitle: fields[0] as String,
      ticketPrice: fields[13] as int,
      cast1Name: fields[3] as String,
      cast1PhotoLink: fields[4] as String,
      cast2Name: fields[5] as String,
      cast2PhotoLink: fields[6] as String,
      cast3Name: fields[7] as String,
      cast3PhotoLink: fields[8] as String,
      cast4Name: fields[9] as String,
      cast4PhotoLink: fields[10] as String,
      cast5Name: fields[11] as String,
      cast5PhotoLink: fields[12] as String,
      movieDetail: fields[1] as String,
      moviePostLink: fields[2] as String,
      nightShowTime: fields[17] as String,
      eveningShowTime: fields[16] as String,
      noonShowTime: fields[15] as String,
      morningShowTime: fields[14] as String,
      endDate: fields[19] as DateTime,
      startDate: fields[18] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MovieModel obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.movieTitle)
      ..writeByte(1)
      ..write(obj.movieDetail)
      ..writeByte(2)
      ..write(obj.moviePostLink)
      ..writeByte(3)
      ..write(obj.cast1Name)
      ..writeByte(4)
      ..write(obj.cast1PhotoLink)
      ..writeByte(5)
      ..write(obj.cast2Name)
      ..writeByte(6)
      ..write(obj.cast2PhotoLink)
      ..writeByte(7)
      ..write(obj.cast3Name)
      ..writeByte(8)
      ..write(obj.cast3PhotoLink)
      ..writeByte(9)
      ..write(obj.cast4Name)
      ..writeByte(10)
      ..write(obj.cast4PhotoLink)
      ..writeByte(11)
      ..write(obj.cast5Name)
      ..writeByte(12)
      ..write(obj.cast5PhotoLink)
      ..writeByte(13)
      ..write(obj.ticketPrice)
      ..writeByte(14)
      ..write(obj.morningShowTime)
      ..writeByte(15)
      ..write(obj.noonShowTime)
      ..writeByte(16)
      ..write(obj.eveningShowTime)
      ..writeByte(17)
      ..write(obj.nightShowTime)
      ..writeByte(18)
      ..write(obj.startDate)
      ..writeByte(19)
      ..write(obj.endDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
