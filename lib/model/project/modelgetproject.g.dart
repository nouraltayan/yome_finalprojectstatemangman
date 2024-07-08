// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelgetproject.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class getProjcetmodelAdapter extends TypeAdapter<getProjcetmodel> {
  @override
  final int typeId = 0;

  @override
  getProjcetmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return getProjcetmodel(
      id: fields[0] as num,
      name: fields[1] as String,
      description: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, getProjcetmodel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is getProjcetmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
