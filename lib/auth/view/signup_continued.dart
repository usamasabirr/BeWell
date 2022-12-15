import 'package:be_well/auth/controller/auth_controller.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SignupContinued extends StatefulWidget {
  const SignupContinued({super.key});

  @override
  State<SignupContinued> createState() => _SignupContinuedState();
}

class _SignupContinuedState extends State<SignupContinued> {
  AuthController authController = Get.find();
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
                  child: Container(
                //color: Colors.blue,
                height: mediaHeight * 0.75,
                child: Padding(
                  padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom) /
                      1.4,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Container(
                        //   width: mediaWidth,
                        //   child: DropdownButton<String>(
                        //     value: authController.bloodType,
                        //     icon: const SizedBox(),
                        //     // icon: Align(
                        //     //   alignment:Alignment.topLeft,
                        //     //   child: const Icon(Icons.arrow_downward)),
                        //     elevation: 16,
                        //     style: TextStyle(color: Colors.grey[600]),
                        //     underline: Container(
                        //       height: 1,
                        //       color: Colors.grey,
                        //     ),
                        //     onChanged: (String? newValue) {
                        //       setState(() {
                        //         authController.bloodType = newValue!;
                        //       });
                        //     },
                        //     items: authController.bloodTypeDropDownValues
                        //         .map<DropdownMenuItem<String>>((String value) {
                        //       return DropdownMenuItem<String>(
                        //         value: value,
                        //         child: Text(value),
                        //       );
                        //     }).toList(),
                        //   ),
                        // ),
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
                          onChanged: (dynamic item) {
                            //print('item is $item');
                            authController.bloodType = item.toString();
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: Icon(Icons.arrow_drop_down),
                              labelText: "Blood Type"),
                          dropdownHeight: 180,
                        ),
                        Obx((() => authController.bloodTypeError.value == true
                            ? Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(top: 5, left: 5),
                                child: Text(
                                  "* Please select blood type",
                                  style: TextStyle(color: Colors.red),
                                ))
                            : SizedBox())),

                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              label: Text('Allergies'),
                              hintText: "Enter allergies"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              label: Text('Diseases'),
                              hintText: "Enter diseases"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              label: Text('Weight'),
                              hintText: "Enter weight (kg)"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
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
                            authController.genderType = item.toString();
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: Icon(Icons.arrow_drop_down),
                              labelText: "Gender"),
                          dropdownHeight: 180,
                        ),
                        Obx((() => authController.genderTypeError.value == true
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
                    onPressed: () {
                      if (authController.bloodType == '') {
                        authController.bloodTypeError.value = true;
                      } else {
                        authController.bloodTypeError.value = false;
                      }
                      if (authController.genderType == '') {
                        authController.genderTypeError.value = true;
                      } else {
                        authController.genderTypeError.value = false;
                      }
                    },
                    child: Text("SIGN UP")),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
