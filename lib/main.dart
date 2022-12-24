import 'package:be_well/account/view/account.dart';
import 'package:be_well/auth/view/login.dart';
import 'package:be_well/auth/view/signup.dart';
import 'package:be_well/auth/view/signup_continued.dart';
import 'package:be_well/auth/view/login_or_signup.dart';
import 'package:be_well/home/controller/home_controller.dart';
import 'package:be_well/home/view/home.dart';
import 'package:be_well/myhomepage/view/myHomePage.dart';
import 'package:be_well/qrcode/view/qr_info_image.dart';
import 'package:be_well/qrcode/view/qrcode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
