import 'package:be_well/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          height: mediaHeight,
          width: mediaWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/background.png'))),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //Icon
                FittedBox(
                  child: Image.asset(
                    'assets/images/Lock-locked.png',
                    height: mediaHeight * 0.2,
                    width: mediaWidth * 0.904,
                    fit: BoxFit.contain,
                  ),
                ),
                //
                Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                //Email
                TextFormField(
                  controller: authController.forgotEmailTextEditingController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text('email'),
                      hintText: "Enter email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* Please enter email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                //button
                SizedBox(
                  height: mediaHeight * 0.06,
                  width: mediaWidth * 0.67,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xff7FD958)),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          authController.forgotPassword();
                        }
                      },
                      child: Text("Send")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
