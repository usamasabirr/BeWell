import 'package:be_well/reminder/controller/sleepreminder_controller.dart';
import 'package:be_well/service/local_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

class SleepReminder extends StatefulWidget {
  const SleepReminder({super.key});

  @override
  State<SleepReminder> createState() => _SleepReminderState();
}

class _SleepReminderState extends State<SleepReminder> {
  SleepReminderController sleepReminderController =
      Get.put(SleepReminderController());
  int count = 0;
  late final LocalNotificationService service;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sleepReminderController.setCurrentTime();
    sleepReminderController.getSavedReminder();
    service = LocalNotificationService();
    service.initialize();
  }

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
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

              //Hours
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      // decoration: BoxDecoration(
                      //     color: Colors.blue[100], border: Border.all()),
                      height: 50,
                      width: 100,
                      child: Center(
                          child: TextField(
                        controller: sleepReminderController.hourController,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ))),
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: Text(
                      "Hours",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              //Wake up
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
                  Text('When do you want to wake up?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
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
                      onFailValidation: (context) =>
                          print('Unavailable selection'),
                      initialTime: TimeOfDay(
                          hour: sleepReminderController.wakeHour.value,
                          minute: sleepReminderController.wakeMin.value),
                      selectableTimePredicate: (p0) => true).then((value) {
                    sleepReminderController.selectedWakeHour.value =
                        value!.hour % 12;
                    sleepReminderController.selectedWakeMin.value =
                        value.minute;

                    sleepReminderController.defaultWakeHour = value.hour;
                    sleepReminderController.defaultWakeMin = value.minute;
                    print('value is ${value.hour}');
                    if (value.hour ~/ 12 == 1) {
                      sleepReminderController.selectedWakeZone.value = 'P M';
                    } else {
                      sleepReminderController.selectedWakeZone.value = 'A M';
                    }

                    sleepReminderController.selectedTime = value;
                    //sleepReminderController.calculateScheduleTime();
                    print(DateTime.now().hour);
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
                          "${sleepReminderController.selectedWakeHour} : ${sleepReminderController.selectedWakeMin}",
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
                            "${sleepReminderController.selectedWakeZone.value}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: mediaHeight * 0.05,
              ),
              //save
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: mediaHeight * 0.06,
                    width: mediaWidth * 0.3,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xff7FD958)),
                        onPressed: () async {
                          sleepReminderController.calculateScheduleTime();
                        },
                        child: Text("Save")),
                  ),
                  SizedBox(
                    height: mediaHeight * 0.06,
                    width: mediaWidth * 0.3,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xff7FD958)),
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          //   authController.logInWithEmailAndPassword();
                          // }
                        },
                        child: Text("Cancel")),
                  ),
                ],
              ),
              //Alarm
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Alarm',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),

              //saved reminder
              SizedBox(
                height: 10,
              ),
              Obx(() => sleepReminderController.sleepReminder.value.hour != ''
                  ? Row(
                      children: [
                        Container(
                          height: mediaHeight * 0.07,
                          width: mediaWidth * 0.7,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.asset('assets/images/blue.png')
                                      .image)),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/bell.png',
                                height: 30,
                                width: 40,
                              ),
                              Text(
                                '${sleepReminderController.sleepReminder.value.hour} : ${sleepReminderController.sleepReminder.value.min} ${sleepReminderController.sleepReminder.value.zone}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.delete)
                      ],
                    )
                  : SizedBox()),
            ],
          ),
        ),
      )),
    );
  }
}
