// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../bmi_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BMIModelAdapter extends TypeAdapter<BMIModel> {
  @override
  final int typeId = 0;

  @override
  BMIModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BMIModel(
      result: fields[0] as double,
      statusText: fields[1] as String,
      statusColor: fields[2] as StatusColor,
    );
  }

  @override
  void write(BinaryWriter writer, BMIModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.result)
      ..writeByte(1)
      ..write(obj.statusText)
      ..writeByte(2)
      ..write(obj.statusColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BMIModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StatusColorAdapter extends TypeAdapter<StatusColor> {
  @override
  final int typeId = 1;

  @override
  StatusColor read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return StatusColor.darkRed;
      case 1:
        return StatusColor.red;
      case 2:
        return StatusColor.orange;
      case 3:
        return StatusColor.yellow;
      case 4:
        return StatusColor.green;
      case 5:
        return StatusColor.grey;
      default:
        return StatusColor.darkRed;
    }
  }

  @override
  void write(BinaryWriter writer, StatusColor obj) {
    switch (obj) {
      case StatusColor.darkRed:
        writer.writeByte(0);
        break;
      case StatusColor.red:
        writer.writeByte(1);
        break;
      case StatusColor.orange:
        writer.writeByte(2);
        break;
      case StatusColor.yellow:
        writer.writeByte(3);
        break;
      case StatusColor.green:
        writer.writeByte(4);
        break;
      case StatusColor.grey:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
