// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_reminder_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SleepReminderModelAdapter extends TypeAdapter<SleepReminderModel> {
  @override
  final int typeId = 1;

  @override
  SleepReminderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SleepReminderModel(
      notificaitonId: fields[0] as String,
      hour: fields[1] as String,
      min: fields[2] as String,
      zone: fields[3] as String,
      scheduleSeconds: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SleepReminderModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.notificaitonId)
      ..writeByte(1)
      ..write(obj.hour)
      ..writeByte(2)
      ..write(obj.min)
      ..writeByte(3)
      ..write(obj.zone)
      ..writeByte(4)
      ..write(obj.scheduleSeconds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SleepReminderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
