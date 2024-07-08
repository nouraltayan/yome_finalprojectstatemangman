// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokenmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class tokenmodelAdapter extends TypeAdapter<tokenmodel> {
  @override
  final int typeId = 2;

  @override
  tokenmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return tokenmodel(
      access_token: fields[0] as String,
      refresh_token: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, tokenmodel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.access_token)
      ..writeByte(1)
      ..write(obj.refresh_token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is tokenmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
