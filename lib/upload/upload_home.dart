import 'package:be_well/reminder/medicineReminder/view/medicine_reminder.dart';
import 'package:be_well/reminder/view/sleepReminder.dart';
import 'package:be_well/sleep/controller/sleepController.dart';
import 'package:be_well/upload/document/view/document.dart';
import 'package:be_well/upload/prescription/view/prescription.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class UploadHome extends StatefulWidget {
  const UploadHome({super.key});

  @override
  State<UploadHome> createState() => _UploadHomeState();
}

class _UploadHomeState extends State<UploadHome> {
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
                'Upload',
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
            height: mediaHeight * 0.15,
          ),

          //Prescription
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
                  Get.to(Prescription());
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/prescrip.png',
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                      ),
                      Text("Prescription")
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
                  Get.to(((MyDocument())));
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/document.png',
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                      ),
                      Text("Document")
                    ])),
          ),
        ],
      )),
    );
  }
}
