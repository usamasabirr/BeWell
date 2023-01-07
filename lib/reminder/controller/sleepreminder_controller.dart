import 'package:be_well/reminder/model/sleep_reminder_model.dart';
import 'package:be_well/service/local_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../sleep/model/sleepMonitor_model.dart';

class SleepReminderController extends GetxController {
  Rx<int> wakeHour = 0.obs;
  Rx<int> wakeMin = 0.obs;
  Rx<String> wakeZone = ''.obs;

  Rx<int> selectedWakeHour = 0.obs;
  Rx<int> selectedWakeMin = 0.obs;
  Rx<String> selectedWakeZone = ''.obs;

  int defaultWakeHour = 0;
  int defaultWakeMin = 0;

  Rx<SleepReminderModel> sleepReminder = SleepReminderModel.empty().obs;

  final LocalNotificationService service = LocalNotificationService();

  late TimeOfDay selectedTime;

  var sleepReminderBox = Hive.box<SleepReminderModel>('SleepReminder');
  TextEditingController hourController = TextEditingController();

  getSavedReminder() {
    if (sleepReminderBox.isNotEmpty) {
      sleepReminder.value = sleepReminderBox.get(0) as SleepReminderModel;
    }
    print(sleepReminder.value.hour);
  }

  setCurrentTime() {
    DateTime currentTime = DateTime.now();

    wakeHour.value = 6;
    wakeMin.value = 00;

    selectedWakeHour.value = 6;
    selectedWakeMin.value = 00;

    if (wakeHour.value ~/ 12 == 1) {
      selectedWakeZone.value = 'P M';
    } else {
      selectedWakeZone.value = 'A M';
    }
  }

//The user will enter a wake time, it calculates the duration from current to that wake time and let the user know
  // calculateScheduleTime() async {
  //   service.initialize();
  //   DateTime currTime = DateTime.now();
  //   var scheduleHour = 0;
  //   var scheduleMin = 0;
  //   var scheduleSeconds = 0;
  //   if (currTime.hour <= selectedTime.hour) {
  //     scheduleHour = selectedTime.hour - currTime.hour;
  //     scheduleMin = selectedTime.minute - currTime.minute;
  //   } else {
  //     var rem = 24 - currTime.hour;
  //     scheduleHour = rem + selectedTime.hour;
  //     scheduleMin = selectedTime.minute - currTime.minute;
  //   }

  //   scheduleSeconds = scheduleHour * 3600;
  //   if (scheduleMin < 0) {
  //     scheduleSeconds -= (scheduleMin.abs() * 60);
  //   } else {
  //     scheduleSeconds += (scheduleMin.abs() * 60);
  //   }

  //   SleepReminderModel temp = SleepReminderModel.empty();
  //   var uuid = Uuid();
  //   var v1 = uuid.v1();
  //   temp.notificaitonId = 0.toString();
  //   temp.hour = selectedWakeHour.value.toString();
  //   temp.min = selectedWakeMin.value.toString();
  //   temp.zone = selectedWakeZone.value;
  //   temp.scheduleSeconds = scheduleSeconds.toString();

  //   sleepReminderBox.put(0, temp);

  //   await service.showScheduleNotification(
  //       id: 0,
  //       title: 'Sleep Reminder',
  //       body: 'Wake up',
  //       seconds: scheduleSeconds);

  //   sleepReminder.value = temp;

  //   print('hour is $scheduleHour');
  //   print('min is $scheduleMin');
  //   print('scheduleSconds is $scheduleSeconds');
  // }

  calculateScheduleTime() async {
    int currHour = DateTime.now().hour;
    int selectHour = selectedTime.hour;
    int enteredHours = int.parse(hourController.text);
    int scheduleHour = 0;

    if (checkIfHourValid()) {
      int currHour = DateTime.now().hour;
      int currMin = DateTime.now().minute;
      int selectHour = selectedTime.hour;
      int selectMin = selectedTime.minute;
      int enteredHours = int.parse(hourController.text);

      if (currHour <= selectHour) {
        int remHour = selectHour - enteredHours;
        remHour = remHour - currHour;

        int totalRemMin = remHour * 60;
        int remMin = (selectMin - currMin).abs();
        if (selectMin > currMin) {
          totalRemMin = totalRemMin + remMin;
        } else {
          totalRemMin = totalRemMin - remMin;
        }
        //print('totalRemMin is $totalRemMin');
      } else {
        int remHour = selectHour - enteredHours;
        if (remHour < 0) {
          remHour -= 24;
        } else {
          int temp = 24 - currHour;
          remHour += temp;
        }
        int remMin = (selectMin - currMin).abs();
        int remHourToMin = remHour * 60;
        int totalRemMin = 0;

        if (selectMin > currMin) {
          totalRemMin = remHourToMin + remMin;
        } else {
          totalRemMin = remHourToMin - remMin;
        }

        print('result is $totalRemMin');
      }
    } else {}
  }

  bool checkIfHourValid() {
    int currHour = DateTime.now().hour;
    int currMin = DateTime.now().minute;
    int selectHour = selectedTime.hour;
    int selectMin = selectedTime.minute;
    int enteredHours = int.parse(hourController.text);

    if (currHour <= selectHour) {
      int remHour = selectHour - currHour;
      int remHourToMin = remHour * 60;

      int remMin = (selectMin - currMin).abs();
      int totalRemMin = 0;

      if (selectMin > currMin) {
        totalRemMin = remHourToMin + remMin;
      } else {
        totalRemMin = remHourToMin - remMin;
      }

      int resultHour = totalRemMin ~/ 60;
      print('totalRemMin $totalRemMin');

      print('result hour is $resultHour');

      if (resultHour >= enteredHours) {
        print('Ok');
        return true;
      } else {
        print('not Ok');
        return false;
      }
    } else {
      int remHour = 24 - currHour;
      remHour += selectHour;

      int remHourToMin = remHour * 60;

      int remMin = (selectMin - currMin).abs();
      int totalRemMin = 0;

      if (selectMin > currMin) {
        totalRemMin = remHourToMin + remMin;
      } else {
        totalRemMin = remHourToMin - remMin;
      }

      int resultHour = totalRemMin ~/ 60;
      print('totalRemMin $totalRemMin');

      print('result hour is $resultHour');

      if (resultHour >= enteredHours) {
        print('Ok');
        return true;
      } else {
        print('not Ok');
        return false;
      }
    }
  }
}
