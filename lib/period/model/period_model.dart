import 'package:hive/hive.dart';

part 'period_model.g.dart';

@HiveType(typeId: 3)
class PeriodModel {
  @HiveField(0)
  late DateTime selectedDate;
  @HiveField(1)
  late int cycleDuration;
  @HiveField(2)
  late DateTime periodDate;

  PeriodModel(
      {required this.selectedDate,
      required this.cycleDuration,
      required this.periodDate});

  PeriodModel.empty() {
    selectedDate = DateTime.now();
    cycleDuration = 0;
    periodDate = DateTime.now();
  }
}
