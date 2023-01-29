import 'package:be_well/reminder/medicineReminder/view/medicine_reminder.dart';
import 'package:be_well/reminder/view/sleepReminder.dart';
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
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back)),
              Expanded(
                child: SizedBox(),
              ),
              Text(
                'Reminder',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Opacity(opacity: 0.0, child: Icon(Icons.arrow_back))
            ]),
          ),
          //Text
          SizedBox(
            height: 10,
          ),
          Text(
            'Which Reminder',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          Text('would you like to choose',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),

          //Sleep
          SizedBox(
            height: mediaHeight * 0.1,
          ),
          SizedBox(
            height: mediaHeight * 0.06,
            width: mediaWidth * 0.67,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), backgroundColor: Color(0xff7FD958)),
                onPressed: () {
                  Get.to(SleepReminder());
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/bedTime.png',
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                      ),
                      Text("Sleep")
                    ])),
          ),

          //Medication
          SizedBox(
            height: mediaHeight * 0.1,
          ),
          SizedBox(
            height: mediaHeight * 0.06,
            width: mediaWidth * 0.67,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), backgroundColor: Color(0xff7FD958)),
                onPressed: () {
                  Get.to((MedicineReminder()));
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/medicine.png',
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                      ),
                      Text("Medication")
                    ])),
          ),
        ],
      )),
    );
  }
}
