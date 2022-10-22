// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DownloadedMovieAdapter extends TypeAdapter<DownloadedMovie> {
  @override
  final int typeId = 0;

  @override
  DownloadedMovie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DownloadedMovie()
      ..path = fields[1] as String
      ..imageLink = fields[2] as String
      ..name = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, DownloadedMovie obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.imageLink)
      ..writeByte(3)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadedMovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
