// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleepMonitor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SleepMonitorModelAdapter extends TypeAdapter<SleepMonitorModel> {
  @override
  final int typeId = 0;

  @override
  SleepMonitorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SleepMonitorModel()
      ..weekDay = (fields[0] as Map).cast<dynamic, dynamic>();
  }

  @override
  void write(BinaryWriter writer, SleepMonitorModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.weekDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SleepMonitorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
