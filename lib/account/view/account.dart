import 'package:be_well/account/controller/account_controller.dart';
import 'package:be_well/account/view/edit_account.dart';
import 'package:be_well/auth/controller/auth_controller.dart';
import 'package:be_well/auth/view/login_or_signup.dart';
import 'package:be_well/main.dart';
import 'package:be_well/myhomepage/controller.dart/myhomepage_controller.dart';
import 'package:be_well/qrcode/controller/qrcode_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  MyHomePageController myHomePageController = Get.find();
  AccountController accountController = Get.put(AccountController());
  AuthController authController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accountController.setPreviousData();
  }

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: mediaHeight,
        width: mediaWidth,
        decoration: BoxDecoration(
            color: Colors.green,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/background.png'))),
        child: Obx(
          () => Column(
            children: [
              //Appbar
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(children: [
                  SizedBox(
                    width: 10,
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Image.asset(
                      'assets/images/edit_button.png',
                      height: mediaWidth * 0.06,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Image.asset(
                    'assets/images/logo_only.png',
                    height: 60,
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(EditAccount());
                    },
                    child: Image.asset(
                      'assets/images/edit_button.png',
                      height: mediaWidth * 0.06,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ]),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Stack(
                children: [
                  Container(
                    //color: Colors.red,
                    height: mediaHeight * 0.7,
                    width: mediaWidth,
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    top: mediaHeight * 0.06,
                    child: Container(
                        height: mediaHeight * 0.6,
                        width: mediaWidth,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          //color: Colors.orange,
                          margin: EdgeInsets.only(
                              top: mediaHeight * 0.12 - mediaHeight * 0.06,
                              left: 20),
                          child: SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    myHomePageController.userInfo.value.name,
                                    style: TextStyle(
                                        color: Color(0xff161455),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Date Of Birth',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    myHomePageController
                                        .userInfo.value.dateOfBirth,
                                    style: TextStyle(
                                        color: Color(0xff161455),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Blood Type',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    myHomePageController
                                        .userInfo.value.bloodType,
                                    style: TextStyle(
                                        color: Color(0xff161455),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Allergies',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    myHomePageController
                                        .userInfo.value.allergies,
                                    style: TextStyle(
                                        color: Color(0xff161455),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Diseases',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    myHomePageController
                                        .userInfo.value.diseases,
                                    style: TextStyle(
                                        color: Color(0xff161455),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Weight (Kg)',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    myHomePageController.userInfo.value.weight,
                                    style: TextStyle(
                                        color: Color(0xff161455),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Height (cm)',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    myHomePageController.userInfo.value.height,
                                    style: TextStyle(
                                        color: Color(0xff161455),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Gender',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    myHomePageController.userInfo.value.gender,
                                    style: TextStyle(
                                        color: Color(0xff161455),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Friend Name',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    myHomePageController
                                        .userInfo.value.friendName,
                                    style: TextStyle(
                                        color: Color(0xff161455),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Friend or Family Number',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    myHomePageController
                                        .userInfo.value.friendNumber,
                                    style: TextStyle(
                                        color: Color(0xff161455),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Doctor Name',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    myHomePageController
                                        .userInfo.value.doctorName,
                                    style: TextStyle(
                                        color: Color(0xff161455),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Doctor Number',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    myHomePageController
                                        .userInfo.value.doctorNumber,
                                    style: TextStyle(
                                        color: Color(0xff161455),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                  Positioned(
                    left: (mediaWidth / 2) - ((mediaHeight * 0.12) / 2),
                    child: Container(
                      height: mediaHeight * 0.12,
                      width: mediaHeight * 0.12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/female_vector.png'))),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: mediaHeight * 0.06,
              //   width: mediaWidth * 0.67,
              //   child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //           shape: StadiumBorder(),
              //           backgroundColor: Color(0xff7FD958)),
              //       onPressed: () {
              //         //qrCodeController.generateQrCode();
              //       },
              //       child: Text("Finish")),
              // )
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: mediaHeight * 0.05,
                    width: mediaWidth / 3,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xff7FD958)),
                        onPressed: () {
                          //qrCodeController.generateQrCode();
                        },
                        child: Text("Delete Acount")),
                  ),
                  SizedBox(
                    height: mediaHeight * 0.05,
                    width: mediaWidth / 3,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xff7FD958)),
                        onPressed: () async {
                          bool res = await authController.logout();
                          if (res) {
                            Get.offAll(LoginOrSignup());
                          }
                          //qrCodeController.generateQrCode();
                        },
                        child: Text("Log out")),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
