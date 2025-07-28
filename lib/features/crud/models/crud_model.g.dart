// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crud_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CrudModelAdapter extends TypeAdapter<CrudModel> {
  @override
  final int typeId = 0;

  @override
  CrudModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CrudModel(
      data: (fields[0] as List?)?.cast<CrudDataModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CrudModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CrudModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CrudDataModelAdapter extends TypeAdapter<CrudDataModel> {
  @override
  final int typeId = 1;

  @override
  CrudDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CrudDataModel(
      createdAt: fields[0] as DateTime?,
      name: fields[1] as String?,
      address: fields[2] as String?,
      phone: fields[3] as String?,
      updatedAt: fields[4] as DateTime?,
      id: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CrudDataModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.createdAt)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CrudDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
