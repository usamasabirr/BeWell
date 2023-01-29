import 'dart:math';

import 'package:be_well/reminder/medicineReminder/model/medicine_reminder_model.dart';
import 'package:be_well/reminder/model/sleep_reminder_model.dart';
import 'package:be_well/service/local_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class MedicineReminderController extends GetxController {
  TextEditingController medicineNameController = TextEditingController();

  Rx<int> wakeHour = 0.obs;
  Rx<int> wakeMin = 0.obs;
  Rx<String> wakeZone = ''.obs;

  Rx<int> selectedMedicineHour = 0.obs;
  Rx<int> selectedMedicineMin = 0.obs;
  Rx<String> selectedMedicineZone = ''.obs;
  int selectedMedicine24Hour = 0;
  int defaultWakeHour = 0;
  int defaultWakeMin = 0;

  var selectedDate = DateTime.now().obs;

  var medicineReminderBox = Hive.box<MedicineReminderModel>('MedicineReminder');

  RxList savedReminders = [].obs;

  LocalNotificationService localNotificationService =
      LocalNotificationService();

  setCurrentTime() {
    DateTime currentTime = DateTime.now();

    wakeHour.value = 6;
    wakeMin.value = 00;

    selectedMedicineHour.value = 6;
    selectedMedicineMin.value = 00;

    if (wakeHour.value ~/ 12 == 1) {
      selectedMedicineZone.value = 'P M';
    } else {
      selectedMedicineZone.value = 'A M';
    }
  }

  saveReminder() async {
    int reminderDuration = getReminderDuration();
    if (reminderDuration == -1) {
      showDialog('Error', 'assets/images/errorCross.png', 'Cannot save alram',
          'error');
    } else {
      MedicineReminderModel medicineReminderModel =
          MedicineReminderModel.empty();
      var uuid = Uuid();
      var v1 = uuid.v1();
      var rand = Random();
      var notId = (rand.nextInt(100) + 10).toString();
      medicineReminderModel.notificaitonId = notId;
      medicineReminderModel.hour = selectedMedicineHour.value.toString();
      medicineReminderModel.min = selectedMedicineMin.value.toString();
      medicineReminderModel.zone = selectedMedicineZone.value;
      medicineReminderModel.scheduleSeconds = reminderDuration.toString();
      medicineReminderModel.medicineName = medicineNameController.text;
      medicineReminderModel.reminderId = v1;
      medicineReminderModel.medicineDate =
          DateFormat('EEEE').format(selectedDate.value);

      await medicineReminderBox.put(v1, medicineReminderModel).then((value) {
        showDialog('Success', 'assets/images/successTick.png',
            'reminder has been saved', 'success');

        localNotificationService.showScheduleNotification(
            id: int.parse(notId),
            title: 'Medicine Reminder',
            body: 'Please take ${medicineNameController.text}',
            seconds: reminderDuration);
      });
      savedReminders.add(medicineReminderModel);
      resetDate();
    }
  }

  resetDate() {
    setCurrentTime();
    medicineNameController.clear();
  }

  deleteSavedReminder(int index) async {
    await localNotificationService.cancelScheduledNotification(
        int.parse(savedReminders[index].notificaitonId));
    await medicineReminderBox
        .delete(savedReminders[index].reminderId)
        .then((value) {
      savedReminders.remove(savedReminders[index]);
    });
  }

  getSavedReminders() {
    medicineReminderBox.keys.forEach((element) {
      print('key $element');
    });
    medicineReminderBox.values.forEach((element) {
      // print(element.medicineName);
      // print(element.notificaitonId);

      savedReminders.add(element);
    });
  }

  getReminderDuration() {
    DateTime fromDateDays = DateTime.now();
    int fromDateHours = fromDateDays.hour;
    int fromDateMin = fromDateDays.minute;

    DateTime toDateDays = selectedDate.value;
    int toDateHours = selectedMedicine24Hour;
    int toDateMinute = selectedMedicineMin.value;
    int result = 0;
    var resultDays = toDateDays.difference(fromDateDays).inHours;
    if (resultDays == 0) {
      if (toDateHours < fromDateHours) {
        print('Hours not valid');
        return -1;
      } else if (toDateHours == fromDateHours) {
        if (toDateMinute <= fromDateMin) {
          print('Hour min invalid');
          return -1;
        } else {
          int remMin = toDateMinute - fromDateMin;
          int remHour = resultDays - fromDateHours + toDateHours;
          int remHourToMin = remHour * 60;

          if (remMin <= 0) {
            result = remHourToMin - remMin.abs();
          } else {
            result = remHourToMin + remMin;
          }
          print('fromDateHours $fromDateHours');
          print('toDateHours $toDateHours');
          print('Hours are $remHour');
          print('result is $result');
        }
      } else {
        print('valid');
        // print('toDateMinute $toDateMinute');
        // print('formDateMinute $fromDateMin');
        int remMin = toDateMinute - fromDateMin;
        int remHour = resultDays - fromDateHours + toDateHours;
        int remHourToMin = remHour * 60;
        int result = 0;
        if (remMin <= 0) {
          result = remHourToMin - remMin.abs();
        } else {
          result = remHourToMin + remMin;
        }
        print('fromDateHours $fromDateHours');
        print('toDateHours $toDateHours');
        print('Hours are $remHour');
        print('result is $result');
      }
    } else {
      int remMin = toDateMinute - fromDateMin;
      int remHour = resultDays - fromDateHours + toDateHours;
      int remHourToMin = remHour * 60;
      int result = 0;
      if (remMin <= 0) {
        result = remHourToMin - remMin.abs();
      } else {
        result = remHourToMin + remMin;
      }
      print('fromDateHours $fromDateHours');
      print('toDateHours $toDateHours');
      print('Hours are $remHour');
      print('result is $result');
    }
    return result * 60;
  }

  showDialog(String title, String icon, String middleText, String type) {
    Get.defaultDialog(
      title: title,
      middleText: 'reminder has been saved',
      titleStyle: TextStyle(
          color: type == "error" ? Colors.red : Colors.green,
          fontSize: 22,
          fontWeight: FontWeight.bold),
      content: Column(
        children: [
          Row(
            children: [
              Image.asset(
                icon,
                height: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(middleText)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: type == "error" ? Colors.red : Colors.green),
              onPressed: () {
                Get.back();
              },
              child: Text('Ok'))
        ],
      ),
    );
  }
}
