import 'package:hive/hive.dart';

part 'medicine_reminder_model.g.dart';

@HiveType(typeId: 2)
class MedicineReminderModel {
  @HiveField(0)
  late String notificaitonId;
  @HiveField(1)
  late String hour;
  @HiveField(2)
  late String min;
  @HiveField(3)
  late String zone;
  @HiveField(4)
  late String scheduleSeconds;
  @HiveField(5)
  late String medicineName;
  @HiveField(6)
  late String medicineDate;

  MedicineReminderModel(
      {required this.notificaitonId,
      required this.hour,
      required this.min,
      required this.zone,
      required this.scheduleSeconds,
      required this.medicineName,
      required this.medicineDate});

  MedicineReminderModel.empty() {
    notificaitonId = '';
    hour = '';
    min = '';
    zone = '';
    scheduleSeconds = '';
  }
}
