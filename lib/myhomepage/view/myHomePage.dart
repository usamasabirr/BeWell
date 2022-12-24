import 'package:be_well/account/view/account.dart';
import 'package:be_well/auth/view/login.dart';
import 'package:be_well/auth/view/signup.dart';
import 'package:be_well/auth/view/signup_continued.dart';
import 'package:be_well/auth/view/login_or_signup.dart';
import 'package:be_well/home/controller/home_controller.dart';
import 'package:be_well/home/view/home.dart';
import 'package:be_well/myhomepage/controller.dart/myhomepage_controller.dart';
import 'package:be_well/qrcode/view/qr_info_image.dart';
import 'package:be_well/qrcode/view/qrcode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyHomePageController myHomePageController = Get.put(MyHomePageController());
  int _selectedIndex = 0;
  List<Widget> widgetOptions = [Home(), QrCode(), Account()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myHomePageController.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            backgroundColor: Colors.grey[300],
            label: 'HOME',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              backgroundColor: Colors.grey[300],
              label: 'Qr Code'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              backgroundColor: Colors.grey[300],
              label: 'Account'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[300],
        onTap: (index) {
          print('index is $index');
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
