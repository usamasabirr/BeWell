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

  TimeOfDay? selectedTime = null;
  LocalNotificationService localNotificationService =
      LocalNotificationService();

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

  deleteReminder() async {
    await localNotificationService.cancelScheduledNotification(0);
    await sleepReminderBox.delete(0);
    sleepReminder.value = SleepReminderModel.empty();
  }

  calculateScheduleTime() async {
    if (hourController.text.isEmpty) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Error',
          message: 'Hours can not be empty',
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    } else if (selectedTime == null) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Error',
          message: 'Select Wake up Time',
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      if (checkIfHourValid()) {
        int currHour = DateTime.now().hour;
        int currMin = DateTime.now().minute;
        int selectHour = selectedTime!.hour;
        int selectMin = selectedTime!.minute;
        int enteredHours = int.parse(hourController.text);
        int totalRemMin = 0;

        if (currHour <= selectHour) {
          int remHour = selectHour - enteredHours;
          remHour = remHour - currHour;

          totalRemMin = remHour * 60;
          int remMin = (selectMin - currMin).abs();
          if (selectMin > currMin) {
            totalRemMin = totalRemMin + remMin;
          } else {
            totalRemMin = totalRemMin - remMin;
          }

          print('result is $totalRemMin');
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
          totalRemMin = 0;

          if (selectMin > currMin) {
            totalRemMin = remHourToMin + remMin;
          } else {
            totalRemMin = remHourToMin - remMin;
          }
        }

        SleepReminderModel temp = SleepReminderModel.empty();

        var uuid = Uuid();
        var v1 = uuid.v1();
        temp.notificaitonId = 0.toString();
        temp.hour = (selectHour - enteredHours).toString();
        temp.min = selectMin.toString();
        temp.zone = selectedWakeZone.value;
        temp.scheduleSeconds = (totalRemMin * 60).toString();

        sleepReminderBox.put(0, temp);
        print('time is ${totalRemMin * 60}');
        await service.showScheduleNotification(
            id: 0,
            title: 'Sleep Reminder',
            body: 'Time to Sleep',
            seconds: (totalRemMin * 60));

        sleepReminder.value = temp;

        print('result is $totalRemMin');
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: 'Error',
            message: 'Entered hours not possible',
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  bool checkIfHourValid() {
    int currHour = DateTime.now().hour;
    int currMin = DateTime.now().minute;
    int selectHour = selectedTime!.hour;
    int selectMin = selectedTime!.minute;
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
      // print('totalRemMin $totalRemMin');

      // print('result hour is $resultHour');

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
