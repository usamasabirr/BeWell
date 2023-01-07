import 'package:hive/hive.dart';

part 'sleep_reminder_model.g.dart';

@HiveType(typeId: 1)
class SleepReminderModel {
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

  SleepReminderModel(
      {required this.notificaitonId,
      required this.hour,
      required this.min,
      required this.zone,
      required this.scheduleSeconds});

  SleepReminderModel.empty() {
    notificaitonId = '';
    hour = '';
    min = '';
    zone = '';
    scheduleSeconds = '';
  }
}
