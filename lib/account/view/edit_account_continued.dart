import 'package:be_well/auth/controller/auth_controller.dart';
import 'package:be_well/auth/view/login_or_signup.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../controller/account_controller.dart';

class EditAccountContinued extends StatefulWidget {
  const EditAccountContinued({super.key});

  @override
  State<EditAccountContinued> createState() => _EditAccountContinuedState();
}

class _EditAccountContinuedState extends State<EditAccountContinued> {
  AccountController accountController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              //app bar
              Row(children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: mediaHeight * 0.03,
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
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ]),
              //Form
              Form(
                  key: _formKey,
                  child: Container(
                    //color: Colors.blue,
                    height: mediaHeight * 0.75,
                    child: Padding(
                      padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).viewInsets.bottom) /
                          1.4,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TextDropdownFormField(
                              options: [
                                "A+",
                                "B+",
                                "AB+",
                                "A-",
                                "B-",
                                "AB-",
                                "O+",
                                "O-"
                              ],
                              // controller:
                              //     accountController.bloodDropDownController.value,
                              onChanged: (dynamic item) {
                                //print('item is $item');
                                accountController.bloodType = item.toString();
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  suffixIcon: Icon(Icons.arrow_drop_down),
                                  labelText: "Blood Type"),
                              dropdownHeight: 180,
                            ),
                            Obx((() => accountController.bloodTypeError.value ==
                                    true
                                ? Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(top: 5, left: 5),
                                    child: Text(
                                      "* Please select blood type",
                                      style: TextStyle(color: Colors.red),
                                    ))
                                : SizedBox())),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //       border: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(10)),
                            //       label: Text('Allergies'),
                            //       hintText: "Enter allergies"),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //       border: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(10)),
                            //       label: Text('Diseases'),
                            //       hintText: "Enter diseases"),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //       border: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(10)),
                            //       label: Text('Weight'),
                            //       hintText: "Enter weight (kg)"),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: accountController.heightController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  label: Text('Height'),
                                  hintText: "Enter height (cm)"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextDropdownFormField(
                              options: ["Male", "Female"],
                              onChanged: (dynamic item) {
                                print('item is $item');
                                accountController.genderType = item.toString();
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  suffixIcon: Icon(Icons.arrow_drop_down),
                                  labelText: "Gender"),
                              dropdownHeight: 180,
                            ),
                            Obx((() => accountController
                                        .genderTypeError.value ==
                                    true
                                ? Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(top: 5, left: 5),
                                    child: Text(
                                      "* Please select gender",
                                      style: TextStyle(color: Colors.red),
                                    ))
                                : SizedBox())),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text('(in case of emergency)')),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller:
                                  accountController.familyNumberController,
                              validator: (value) {
                                String pattern = r'(^(?:[+0]966)?966[0-9]{9}$)';
                                RegExp regExp = new RegExp(pattern);
                                if (value!.length > 0) {
                                  if (!regExp.hasMatch(value)) {
                                    return 'Please enter valid mobile number +966 XX XXXXXXX';
                                  }
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  label: Text('Friend or Family Number'),
                                  hintText: "(+966)"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                controller:
                                    accountController.familyNameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  label: Text('Friend or Family Name'),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text('(in case of emergency)')),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                String pattern = r'(^(?:[+0]966)?966[0-9]{9}$)';
                                RegExp regExp = new RegExp(pattern);
                                if (value!.length > 0) {
                                  if (!regExp.hasMatch(value)) {
                                    return 'Please enter valid mobile number +966 XX XXXXXXX';
                                  }
                                }
                              },
                              controller:
                                  accountController.doctorNumberController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  label: Text('Doctor Number'),
                                  hintText: "(+966)"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller:
                                  accountController.doctorNameController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  label: Text('Doctor Name'),
                                  hintText: "(+966)"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              //singup button
              SizedBox(
                height: mediaHeight * 0.06,
                width: mediaWidth * 0.67,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Color(0xff7FD958)),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (accountController.bloodType == '') {
                          accountController.bloodTypeError.value = true;
                        } else {
                          accountController.bloodTypeError.value = false;
                        }
                        if (accountController.genderType == '') {
                          accountController.genderTypeError.value = true;
                        } else {
                          accountController.genderTypeError.value = false;
                        }
                        accountController.updateData();
                      }
                      // print(accountController.bytes);
                      // Get.offAll(LoginOrSignup());
                    },
                    child: Text("Update Info")),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void qrCodeDialogBox() {
    // Get.defaultDialog(
    //     title: "Qr Code",
    //     content: FittedBox(
    //       child: WidgetsToImage(
    //         controller: accountController.controller,
    //         child: Container(
    //           height: 200,
    //           width: 200,
    //           child: QrImage(
    //             data: "1234567890",
    //             version: QrVersions.auto,
    //             size: 200.0,
    //           ),
    //         ),
    //       ),
    //     ));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // WidgetsToImage(
                    //   controller: accountController.widgetsToImageController,
                    //   child: QrImage(
                    //     data: "1234567890",
                    //     version: QrVersions.auto,
                    //     size: 200.0,
                    //   ),
                    // ),
                    SizedBox(
                      width: 320.0,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
