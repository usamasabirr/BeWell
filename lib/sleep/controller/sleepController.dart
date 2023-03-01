import 'package:be_well/sleep/model/sleepMonitor_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}

class SleepController extends GetxController {
  var sleepMonitorBox = Hive.box<SleepMonitorModel>('SleepMonitor');
  late List<ChartData> data = [];
  double result = 0;
  RxDouble averageSleepTime = 0.0.obs;
  //sleep Time
  Rx<int> sleepHour = 0.obs;
  Rx<int> sleepMin = 0.obs;
  Rx<String> sleepZone = ''.obs;

  Rx<int> selectedSleepHour = 0.obs;
  Rx<int> selectedSleepMin = 0.obs;
  Rx<String> selectedSleepZone = ''.obs;

  int defaultSleepHour = 0;
  int defaultSleepMin = 0;

//wakeup time
  Rx<int> wakeHour = 0.obs;
  Rx<int> wakeMin = 0.obs;
  Rx<String> wakeZone = ''.obs;

  Rx<int> selectedWakeHour = 0.obs;
  Rx<int> selectedWakeMin = 0.obs;
  Rx<String> selectedWakeZone = ''.obs;

  int defaultWakeHour = 0;
  int defaultWakeMin = 0;

  setCurrentTime() {
    DateTime currentTime = DateTime.now();
    sleepHour.value = 6;
    sleepMin.value = 00;

    wakeHour.value = 6;
    wakeMin.value = 00;

    selectedSleepHour.value = 6;
    selectedSleepMin.value = 00;

    selectedWakeHour.value = 6;
    selectedWakeMin.value = 00;

    defaultSleepHour = 6;
    defaultSleepMin = 0;

    defaultWakeHour = 6;
    defaultWakeMin = 0;

    if (sleepHour.value ~/ 12 == 1) {
      selectedSleepZone.value = 'P M';
      selectedWakeZone.value = 'P M';
    } else {
      selectedSleepZone.value = 'A M';
      selectedWakeZone.value = 'A M';
    }
  }

  calculateSleepTime() {
    int totalRemMin = 0;
    //print(sleepMonitorBox.get(0));
    if (defaultSleepHour <= defaultWakeHour) {
      int remHour = defaultWakeHour - defaultSleepHour;
      totalRemMin = remHour * 60;
      int remMin = (defaultWakeMin - defaultSleepMin).abs();
      if (defaultWakeMin > defaultSleepMin) {
        totalRemMin = totalRemMin + remMin;
      } else {
        totalRemMin = totalRemMin - remMin;
      }
    } else {
      int remHour = 24 - defaultSleepHour;
      remHour += defaultWakeHour;

      totalRemMin = remHour * 60;
      int remMin = (defaultWakeMin - defaultSleepMin).abs();
      if (defaultWakeMin > defaultSleepMin) {
        totalRemMin = totalRemMin + remMin;
      } else {
        totalRemMin = totalRemMin - remMin;
      }
    }
    print('total $totalRemMin');

    result = totalRemMin / 60;

    DateTime date = DateTime.now();
    String currentDay = DateFormat('EEEE').format(date);
    print('currentDay is $currentDay');
    SleepMonitorModel temp = SleepMonitorModel();
    temp.weekDay[currentDay] = result;
    temp.weekDay['Monday'] = 10.0;
    temp.weekDay['Saturday'] = 15.0;

    sleepMonitorBox.put(0, temp);
    SleepMonitorModel temp1 = sleepMonitorBox.get(0) as SleepMonitorModel;
  }

  getSleepData() {
    double sum = 0;
    SleepMonitorModel temp1 = sleepMonitorBox.get(0) as SleepMonitorModel;
    temp1.weekDay.forEach((key, value) {
      ChartData chart = ChartData(key, value);
      print('value is $value');
      data.add(chart);
      sum += value;
    });
    averageSleepTime.value = sum / 24;
  }
}
