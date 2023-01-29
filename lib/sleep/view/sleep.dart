import 'package:be_well/sleep/controller/sleepController.dart';
import 'package:be_well/sleep/view/weekly_sleep_monitor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

class Sleep extends StatefulWidget {
  const Sleep({super.key});

  @override
  State<Sleep> createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  SleepController sleepController = Get.put(SleepController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sleepController.setCurrentTime();
  }

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //app bar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: mediaHeight * 0.1,
            width: mediaWidth,
            child: Row(children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back)),
              Expanded(
                child: SizedBox(),
              ),
              Text(
                'Sleep Monitor',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Opacity(opacity: 0.0, child: Icon(Icons.arrow_back))
            ]),
          ),

          //Bed Time
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/sleepHour.png',
                height: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text('What is your bed time?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(
            height: 10,
          ),

          InkWell(
            onTap: () {
              showCustomTimePicker(
                  context: context,
                  // It is a must if you provide selectableTimePredicate
                  onFailValidation: (context) => print('Unavailable selection'),
                  initialTime: TimeOfDay(
                      hour: sleepController.sleepHour.value,
                      minute: sleepController.sleepMin.value),
                  selectableTimePredicate: (p0) => true).then((value) {
                sleepController.selectedSleepHour.value = value!.hour % 12;
                sleepController.selectedSleepMin.value = value.minute;

                sleepController.defaultSleepHour = value.hour;
                sleepController.defaultSleepMin = value.minute;
                print('value is ${value.hour}');
                if (value.hour ~/ 12 == 1) {
                  sleepController.selectedSleepZone.value = 'P M';
                } else {
                  sleepController.selectedSleepZone.value = 'A M';
                }
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[100], border: Border.all()),
                  height: 50,
                  width: 100,
                  child: Center(
                      child: Obx(
                    () => Text(
                      "${sleepController.selectedSleepHour} : ${sleepController.selectedSleepMin}",
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[100], border: Border.all()),
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Obx(
                      () => Text(
                        "${sleepController.selectedSleepZone.value}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Wake Time
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/sun.png',
                height: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text('What is your wake up time?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(
            height: 10,
          ),

          InkWell(
            onTap: () {
              showCustomTimePicker(
                  context: context,
                  // It is a must if you provide selectableTimePredicate
                  onFailValidation: (context) => print('Unavailable selection'),
                  initialTime: TimeOfDay(
                      hour: sleepController.wakeHour.value,
                      minute: sleepController.wakeMin.value),
                  selectableTimePredicate: (p0) => true).then((value) {
                sleepController.selectedWakeHour.value = value!.hour % 12;
                sleepController.selectedWakeMin.value = value.minute;

                sleepController.defaultWakeHour = value.hour;
                sleepController.defaultWakeMin = value.minute;
                print('value is ${value.hour}');
                if (value.hour ~/ 12 == 1) {
                  sleepController.selectedWakeZone.value = 'P M';
                } else {
                  sleepController.selectedWakeZone.value = 'A M';
                }
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[100], border: Border.all()),
                  height: 50,
                  width: 100,
                  child: Center(
                      child: Obx(
                    () => Text(
                      "${sleepController.selectedWakeHour} : ${sleepController.selectedWakeMin}",
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[100], border: Border.all()),
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Obx(
                      () => Text(
                        "${sleepController.selectedWakeZone.value}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: mediaHeight * 0.08,
          ),
          //Login button
          SizedBox(
            height: mediaHeight * 0.06,
            width: mediaWidth * 0.67,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), backgroundColor: Color(0xff7FD958)),
                onPressed: () {
                  sleepController.calculateSleepTime();
                  Get.defaultDialog(
                      title: 'Success',
                      middleText:
                          'Saved time is ${sleepController.result} hours',
                      titleStyle: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold));
                },
                child: Text("Save")),
          ),
          //Weekly sleep Monitor
          SizedBox(
            height: mediaHeight * 0.05,
          ),
          SizedBox(
            height: mediaHeight * 0.06,
            width: mediaWidth * 0.67,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), backgroundColor: Color(0xff7FD958)),
                onPressed: () {
                  Get.to(WeeklySleepMonitor());
                },
                child: Text("Weekly sleep Monitor")),
          ),
        ],
      )),
    );
  }
}
