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

    if (sleepHour.value ~/ 12 == 1) {
      selectedSleepZone.value = 'P M';
      selectedWakeZone.value = 'P M';
    } else {
      selectedSleepZone.value = 'A M';
      selectedWakeZone.value = 'A M';
    }
  }

  calculateSleepTime() {
    print(sleepMonitorBox.get(0));
    int sleepHour = (defaultWakeHour - defaultSleepHour).abs();
    int sleepMin = (defaultWakeMin - defaultSleepMin).abs();
    double value = sleepHour + sleepMin / 100;
    print('value is $value');
    DateTime date = DateTime.now();
    String currentDay = DateFormat('EEEE').format(date);

    SleepMonitorModel temp = SleepMonitorModel();
    temp.weekDay[currentDay] = value;
    temp.weekDay['Monday'] = 10.0;
    temp.weekDay['Saturday'] = 15.0;

    sleepMonitorBox.put(0, temp);
    SleepMonitorModel temp1 = sleepMonitorBox.get(0) as SleepMonitorModel;
    print('get Value is ${temp1.weekDay}');

    //print(DateFormat('EEEE').format(date));

    print('sleep hour is $sleepHour');
    print('sleep min is $sleepMin');
  }

  getSleepData() {
    SleepMonitorModel temp1 = sleepMonitorBox.get(0) as SleepMonitorModel;
    temp1.weekDay.forEach((key, value) {
      ChartData chart = ChartData(key, value);
      data.add(chart);
    });
  }
}
