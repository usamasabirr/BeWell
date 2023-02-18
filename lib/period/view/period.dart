import 'package:be_well/period/controller/period_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Period extends StatefulWidget {
  const Period({super.key});

  @override
  State<Period> createState() => _PeriodState();
}

class _PeriodState extends State<Period> {
  DateTime selectedDate = DateTime.now();
  PeriodController periodController = Get.put(PeriodController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    periodController.checkIfPeriod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(left: 20),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Menstrual Cycle',
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
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'When Did Your Last Period Start?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'You need to enter the date of last day of your last period',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    _selectDate(context, 1);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 30),
                    padding: EdgeInsets.only(left: 5),
                    height: mediaHeight * 0.075,
                    width: mediaWidth / 3 + 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      Icon(
                        Icons.calendar_month,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () => Text(DateFormat.yMMMd()
                            .format(periodController.selectedDate.value)),
                      ),
                    ]),
                  ),
                ),
              ),
              //Text
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'How long is your cycle?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'You need to enter how many days between each period',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 30),
                  padding: EdgeInsets.only(left: 5),
                  width: mediaWidth / 3 + 20,
                  child: TextFormField(
                    controller: periodController.cycleDurationController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.access_time),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: Text(
                          'Cycle Duration',
                          style: TextStyle(fontSize: 14),
                        ),
                        hintText: "Enter Days"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '* Please enter password';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //text
              Obx(
                () => periodController.isPeriod.value == true
                    ? Column(children: [
                        Text(
                          'Your Period is likely to start on ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          DateFormat.yMMMd()
                              .format(periodController.periodDate.value),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ])
                    : SizedBox(),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SizedBox(),
              ),
              // button
              Obx(
                () => periodController.isPeriod.value == false
                    ? SizedBox(
                        height: mediaHeight * 0.06,
                        width: mediaWidth * 0.67,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: Color(0xff7FD958)),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                periodController.calculateDuration();
                                // var check =
                                //     await authController.logInWithEmailAndPassword();
                                // if (check) {
                                //   Get.to(MyHomePage());
                                // }
                              }
                            },
                            child: Text("Calculate")),
                      )
                    : SizedBox(
                        height: mediaHeight * 0.06,
                        width: mediaWidth * 0.67,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: Color(0xff7FD958)),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                periodController.deletePeriod();
                                // var check =
                                //     await authController.logInWithEmailAndPassword();
                                // if (check) {
                                //   Get.to(MyHomePage());
                                // }
                              }
                            },
                            child: Text("Delete Period")),
                      ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      )),
    );
  }

  Future<void> _selectDate(BuildContext context, int dateType) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        periodController.selectedDate.value = picked;
      });
    }
  }
}
