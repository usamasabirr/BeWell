import 'package:be_well/reminder/medicineReminder/model/medicine_reminder_model.dart';
import 'package:be_well/reminder/model/sleep_reminder_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

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
    MedicineReminderModel medicineReminderModel = MedicineReminderModel.empty();
    medicineReminderModel.notificaitonId = 1.toString();
    medicineReminderModel.hour = selectedMedicineHour.value.toString();
    medicineReminderModel.min = selectedMedicineMin.value.toString();
    medicineReminderModel.zone = selectedMedicineZone.value;
    medicineReminderModel.scheduleSeconds = reminderDuration.toString();
    medicineReminderModel.medicineName = medicineNameController.text;
    medicineReminderModel.medicineDate =
        DateFormat('EEEE').format(selectedDate.value);

    await medicineReminderBox.add(medicineReminderModel);
  }

  getSavedReminders() {
    medicineReminderBox.values.forEach((element) {
      print(element.medicineName);
      print(element.notificaitonId);
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
      } else if (toDateHours == fromDateHours) {
        if (toDateMinute <= fromDateMin) {
          print('Hour min invalid');
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
}
