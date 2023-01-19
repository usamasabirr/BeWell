// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_reminder_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicineReminderModelAdapter extends TypeAdapter<MedicineReminderModel> {
  @override
  final int typeId = 2;

  @override
  MedicineReminderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicineReminderModel(
      notificaitonId: fields[0] as String,
      hour: fields[1] as String,
      min: fields[2] as String,
      zone: fields[3] as String,
      scheduleSeconds: fields[4] as String,
      medicineName: fields[5] as String,
      medicineDate: fields[6] as String,
      reminderId: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MedicineReminderModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.notificaitonId)
      ..writeByte(1)
      ..write(obj.hour)
      ..writeByte(2)
      ..write(obj.min)
      ..writeByte(3)
      ..write(obj.zone)
      ..writeByte(4)
      ..write(obj.scheduleSeconds)
      ..writeByte(5)
      ..write(obj.medicineName)
      ..writeByte(6)
      ..write(obj.medicineDate)
      ..writeByte(7)
      ..write(obj.reminderId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineReminderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
