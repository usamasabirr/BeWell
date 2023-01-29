import 'package:be_well/period/model/period_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../reminder/model/sleep_reminder_model.dart';

class PeriodController extends GetxController {
  var selectedDate = DateTime.now().obs;
  TextEditingController cycleDurationController = TextEditingController();
  Rx<DateTime> periodDate = DateTime.now().obs;
  Rx<bool> isPeriod = false.obs;
  PeriodModel period = PeriodModel.empty();
  var periodBox = Hive.box<PeriodModel>('Period');

  checkIfPeriod() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isPeriod.value = sharedPreferences.getBool('isPeriod') ?? false;
    if (isPeriod.value) {
      print('in the period');
      period = periodBox.getAt(0) ?? PeriodModel.empty();
      selectedDate.value = period.selectedDate;
      cycleDurationController.text = period.cycleDuration.toString();
      periodDate.value = period.periodDate;
    }
  }

  calculateDuration() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int days = int.parse(cycleDurationController.text);
    periodDate.value = selectedDate.value.add(Duration(days: days));
    isPeriod.value = true;
    period.selectedDate = selectedDate.value;
    period.cycleDuration = days;
    period.periodDate = periodDate.value;

    periodBox.put(0, period);
    sharedPreferences.setBool('isPeriod', true);
  }

  deletePeriod() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    isPeriod.value = false;
    selectedDate.value = DateTime.now();
    cycleDurationController.clear();
    sharedPreferences.setBool('isPeriod', false);
    periodBox.clear();
  }
}
