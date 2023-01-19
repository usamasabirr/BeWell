import 'package:be_well/myhomepage/controller.dart/myhomepage_controller.dart';
import 'package:be_well/sleep/view/sleep.dart';
import 'package:be_well/sleep/view/weekly_sleep_monitor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MyHomePageController myHomePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: mediaHeight * 0.1,
              width: mediaWidth,
              //color: Colors.red,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/female_user.png',
                    height: mediaHeight * 0.08,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Obx(
                          () => Text(
                            myHomePageController.userInfo.value.username,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Image.asset(
                    'assets/images/union.png',
                    height: mediaHeight * 0.04,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.green,
              height: mediaHeight * 0.14,
              width: mediaWidth * 0.9,
              child: Stack(children: [
                Container(
                  width: mediaWidth * 0.9,
                  height: mediaHeight * 0.14,
                  child: Image.asset(
                    'assets/images/blue.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: mediaHeight * 0.02,
                  child: Container(
                    height: mediaHeight * 0.1,
                    child: Image.asset(
                      'assets/images/logo_only.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Be Well",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Services",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: mediaWidth * 0.2,
                            width: mediaWidth * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ),
                            child: Image.asset(
                              'assets/images/period.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('PERIOD')
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(Sleep());
                            },
                            child: Container(
                              height: mediaWidth * 0.2,
                              width: mediaWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue[900],
                              ),
                              child: Image.asset(
                                'assets/images/sleep.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('SLEEP')
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: mediaWidth * 0.2,
                            width: mediaWidth * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            child: Image.asset(
                              'assets/images/upload.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('UPLOAD')
                        ]),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(

                //color: Colors.green,
                height: mediaWidth * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: mediaWidth * 0.3,
                            width: mediaWidth * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue[900],
                            ),
                            child: Image.asset(
                              'assets/images/reminder.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('REMINDER')
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: mediaWidth * 0.5,
                            width: mediaWidth * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ),
                            child: Image.asset(
                              'assets/images/qrcode.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('QR CODE')
                        ]),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
