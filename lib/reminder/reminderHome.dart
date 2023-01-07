import 'package:be_well/sleep/controller/sleepController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ReminderHome extends StatefulWidget {
  const ReminderHome({super.key});

  @override
  State<ReminderHome> createState() => _ReminderHomeState();
}

class _ReminderHomeState extends State<ReminderHome> {
  //SleepController sleepController = Get.find();
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
              Icon(Icons.arrow_back),
              Expanded(
                child: SizedBox(),
              ),
              Text(
                'Sleep Reminder',
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
              Text('How many hours do you want to sleep?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(
            height: 10,
          ),

          InkWell(
            onTap: () {
              // showCustomTimePicker(
              //     context: context,
              //     // It is a must if you provide selectableTimePredicate
              //     onFailValidation: (context) => print('Unavailable selection'),
              //     initialTime: TimeOfDay(
              //         hour: sleepController.sleepHour.value,
              //         minute: sleepController.sleepMin.value),
              //     selectableTimePredicate: (p0) => true).then((value) {
              //   sleepController.selectedSleepHour.value = value!.hour % 12;
              //   sleepController.selectedSleepMin.value = value.minute;

              //   sleepController.defaultSleepHour = value.hour;
              //   sleepController.defaultSleepMin = value.minute;
              //   print('value is ${value.hour}');
              //   if (value.hour ~/ 12 == 1) {
              //     sleepController.selectedSleepZone.value = 'P M';
              //   } else {
              //     sleepController.selectedSleepZone.value = 'A M';
              //   }
              // });
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
                    child: Center(child: TextField())),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[100], border: Border.all()),
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Text(
                      "${0}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
