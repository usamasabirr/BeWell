import 'package:be_well/account/view/account.dart';
import 'package:be_well/auth/view/login.dart';
import 'package:be_well/auth/view/signup.dart';
import 'package:be_well/auth/view/signup_continued.dart';
import 'package:be_well/auth/view/login_or_signup.dart';
import 'package:be_well/home/view/home.dart';
import 'package:be_well/qrcode/view/qrcode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
      home: const LoginOrSignup(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> widgetOptions = [Home(), QrCode(), Account()];
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
