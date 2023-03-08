import 'package:be_well/reminder/controller/sleepreminder_controller.dart';
import 'package:be_well/reminder/medicineReminder/controller/medicine_reminder_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

class MedicineReminder extends StatefulWidget {
  const MedicineReminder({super.key});

  @override
  State<MedicineReminder> createState() => _MedicineReminderState();
}

class _MedicineReminderState extends State<MedicineReminder> {
  // SleepReminderController sleepReminderController =
  //     Get.put(SleepReminderController());
  MedicineReminderController medicineReminderController =
      Get.put(MedicineReminderController());
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    //medicineReminderController.medicineReminderBox.clear();
    medicineReminderController.setCurrentTime();
    medicineReminderController.getSavedReminders();
    super.initState();
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
                'Medication Reminder',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Opacity(opacity: 0.0, child: Icon(Icons.arrow_back))
            ]),
          ),

          //Name

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/medicine.png',
                height: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text('What is the name of your medicine?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: mediaWidth * 0.12),
            child: Center(
                child: Form(
              key: _formKey,
              child: TextFormField(
                controller: medicineReminderController.medicineNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '* Please enter medicine name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter medicine name'),
              ),
            )),
          ),

          //intake Time
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/medicineTime.png',
                height: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text('What is the time to take it?',
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
                      hour: medicineReminderController.wakeHour.value,
                      minute: medicineReminderController.wakeMin.value),
                  selectableTimePredicate: (p0) => true).then((value) {
                medicineReminderController.selectedMedicine24Hour = value!.hour;
                medicineReminderController.selectedMedicineHour.value =
                    value!.hour % 12;
                medicineReminderController.selectedMedicineMin.value =
                    value.minute;

                medicineReminderController.defaultWakeHour = value.hour;
                medicineReminderController.defaultWakeMin = value.minute;
                print('value is ${value.hour}');
                if (value.hour ~/ 12 == 1) {
                  medicineReminderController.selectedMedicineZone.value = 'P M';
                } else {
                  medicineReminderController.selectedMedicineZone.value = 'A M';
                }

                // medicineReminderController.selectedTime = value;
                //medicineReminderController.calculateScheduleTime();
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
                      "${medicineReminderController.selectedMedicineHour} : ${medicineReminderController.selectedMedicineMin}",
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
                        "${medicineReminderController.selectedMedicineZone.value}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

          //which Day
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/whichDay.png',
                height: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Which day?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              _selectDate(context, 1);
            },
            child: Container(
              margin: EdgeInsets.only(left: 30),
              padding: EdgeInsets.only(left: 5),
              height: mediaHeight * 0.06,
              width: mediaWidth / 3 + 20,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                Obx(
                  () => Text(DateFormat.yMMMd()
                      .format(medicineReminderController.selectedDate.value)),
                ),
                Icon(
                  Icons.calendar_month,
                  color: Color(0xffF4B755),
                ),
              ]),
            ),
          ),

          //Save or cancel
          SizedBox(
            height: mediaHeight * 0.02,
          ),
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
                      if (_formKey.currentState!.validate()) {
                        medicineReminderController.saveReminder();
                      }
                      //medicineReminderController.getReminderDuration();
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
                      medicineReminderController.resetDate();
                    },
                    child: Text("Cancel")),
              ),
            ],
          ),
          //Alarm
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Alarm',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //List of saved Reminders
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Obx(
                () => ListView.builder(
                    itemCount:
                        medicineReminderController.savedReminders.value.length,
                    itemBuilder: ((context, index) {
                      return Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
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
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${medicineReminderController.savedReminders[index].hour} : ${medicineReminderController.savedReminders[index].min} ${medicineReminderController.savedReminders[index].zone}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        '${medicineReminderController.savedReminders[index].medicineName}, ${medicineReminderController.savedReminders[index].medicineDate}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ])
                              ],
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                medicineReminderController
                                    .deleteSavedReminder(index);
                              },
                              child: Icon(Icons.delete))
                        ],
                      );
                    })),
              ),
            ),
          )
        ],
      )),
    );
  }

  Future<void> _selectDate(BuildContext context, int dateType) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        medicineReminderController.selectedDate.value = picked;
        //print(chatController.startDate);
        // startDate = selectedDate.toString();
        // print('start date is $startDate');
      });
    }
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:time_picker_widget/time_picker_widget.dart';

// class MedicineReminder extends StatefulWidget {
//   const MedicineReminder({super.key});

//   @override
//   State<MedicineReminder> createState() => _MedicineReminderState();
// }

// class _MedicineReminderState extends State<MedicineReminder> {
//   DateTime fromDateDays = DateTime.now();
//   DateTime toDateDays = DateTime.now();
//   int fromDateHours = DateTime.now().hour;
//   int fromDateMin = DateTime.now().minute;
//   int toDateHours = 0;
//   int toDateMinute = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(children: [
//           ElevatedButton(
//               onPressed: () async {
//                 var picked = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(2020),
//                     lastDate: DateTime(2024));
//                 if (picked != null) {
//                   setState(() {
//                     fromDateDays = picked;
//                   });
//                 }
//               },
//               child: Text('From')),
//           ElevatedButton(
//               onPressed: () async {
//                 var picked = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(2020),
//                     lastDate: DateTime(2024));
//                 if (picked != null) {
//                   setState(() {
//                     print(picked.hour);
//                     toDateDays = picked;
//                   });
//                 }
//               },
//               child: Text('To')),
//           ElevatedButton(
//               onPressed: () async {
//                 var picked = showCustomTimePicker(
//                     context: context,
//                     // It is a must if you provide selectableTimePredicate
//                     onFailValidation: (context) =>
//                         print('Unavailable selection'),
//                     initialTime: TimeOfDay(hour: 6, minute: 0),
//                     selectableTimePredicate: (p0) => true).then((value) {
//                   toDateHours = value!.hour;
//                   toDateMinute = value!.minute;
//                 });
//               },
//               child: Text('ToTimePicker')),
//           ElevatedButton(
//               onPressed: () {
//                 var resultDays = toDateDays.difference(fromDateDays).inHours;
//                 if (resultDays == 0) {
//                   if (toDateHours < fromDateHours) {
//                     print('Hours not valid');
//                   } else {
//                     print('valid');
//                     // print('toDateMinute $toDateMinute');
//                     // print('formDateMinute $fromDateMin');
//                     int remMin = toDateMinute - fromDateMin;
//                     int remHour = resultDays - fromDateHours + toDateHours;
//                     int remHourToMin = remHour * 60;
//                     int result = 0;
//                     if (remMin <= 0) {
//                       result = remHourToMin - remMin.abs();
//                     } else {
//                       result = remHourToMin + remMin;
//                     }
//                     print('fromDateHours $fromDateHours');
//                     print('toDateHours $toDateHours');
//                     print('Hours are $remHour');
//                     print('result is $result');
//                   }
//                 } else {
//                   int remMin = toDateMinute - fromDateMin;
//                   int remHour = resultDays - fromDateHours + toDateHours;
//                   int remHourToMin = remHour * 60;
//                   int result = 0;
//                   if (remMin <= 0) {
//                     result = remHourToMin - remMin.abs();
//                   } else {
//                     result = remHourToMin + remMin;
//                   }
//                   print('fromDateHours $fromDateHours');
//                   print('toDateHours $toDateHours');
//                   print('Hours are $remHour');
//                   print('result is $result');
//                 }
//               },
//               child: Text('subtract'))
//         ]),
//       ),
//     );
//   }
// }
