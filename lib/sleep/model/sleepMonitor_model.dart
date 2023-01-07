import 'package:hive/hive.dart';

part 'sleepMonitor_model.g.dart';

@HiveType(typeId: 0)
class SleepMonitorModel {
  @HiveField(0)
  Map weekDay = {
    'Monday': 0.0,
    'Tuesday': 0.0,
    'Wednesday': 0.0,
    'Thursday': 0.0,
    'Friday': 0.0,
    'Saturday': 0.0,
    'Sunday': 0.0
  };
}
