import 'package:be_well/auth/controller/auth_controller.dart';
import 'package:be_well/auth/view/signup_continued.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: mediaHeight,
        width: mediaWidth,
        child: Stack(
          children: [
            //Icon
            Container(
              width: mediaWidth,
              height: mediaHeight * 0.35,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background.png'),
                ),
              ),
              child: FittedBox(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: mediaHeight * 0.32,
                  width: mediaWidth * 0.904,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            //Signup
            Positioned(
              top: mediaHeight * 0.26,
              child: Container(
                height: mediaHeight * 0.74,
                width: mediaWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(
                    height: mediaHeight * 0.03,
                  ),
                  Text(
                    "Signup",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: mediaHeight * 0.01,
                  ),
                  Form(
                      key: _formKey,
                      child: Container(
                        //color: Colors.red,
                        height: mediaHeight * 0.49,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom /
                                  1.4),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                //name
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('Name'),
                                      hintText: "Enter name"),
                                  controller: authController.nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '* Please enter name';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: mediaHeight * 0.01,
                                ),
                                //email
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('Email'),
                                      hintText: "Enter email"),
                                  controller: authController.emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '* Please enter email';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: mediaHeight * 0.01,
                                ),
                                //username
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('Username'),
                                      hintText: "Enter username"),
                                  controller: authController.usernameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '* Please enter username';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: mediaHeight * 0.01,
                                ),
                                //password
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('password'),
                                      hintText: "Enter password"),
                                  controller: authController.passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '* Please enter password';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: mediaHeight * 0.01,
                                ),
                                //confirmPassword
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('Confirm password'),
                                      hintText: "Enter password again"),
                                  controller:
                                      authController.confirmPasswordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '* Please confirm password';
                                    } else if (value !=
                                        authController
                                            .passwordController.text) {
                                      return 'Password mismatch';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: mediaHeight * 0.01,
                                ),
                                //date of birth
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '* Please select date of birth';
                                    }
                                    return null;
                                  },
                                  controller: authController.dateController,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate:
                                            DateTime.now(), //get today's date
                                        firstDate: DateTime(
                                            1900), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));
                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy').format(
                                              pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2022-07-04
                                      //You can format date as per your need

                                      setState(() {
                                        authController.dateController.text =
                                            formattedDate; //set foratted date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('Date of birth'),
                                      hintText: "Enter dob"),
                                ),

                                //Forgot your password
                              ],
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: mediaHeight * 0.02,
                  ),
                  //Next
                  SizedBox(
                    height: mediaHeight * 0.06,
                    width: mediaWidth * 0.67,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xff7FD958)),
                        onPressed: () {
                          //if (_formKey.currentState!.validate()) {
                          Get.to(SignupContinued());
                          //}
                        },
                        child: Text("Next")),
                  ),
                ]),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
