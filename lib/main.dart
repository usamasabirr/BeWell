import 'package:be_well/account/view/account.dart';
import 'package:be_well/auth/controller/auth_controller.dart';
import 'package:be_well/auth/view/forgot_password.dart';
import 'package:be_well/auth/view/login.dart';
import 'package:be_well/auth/view/signup.dart';
import 'package:be_well/auth/view/signup_continued.dart';
import 'package:be_well/auth/view/login_or_signup.dart';
import 'package:be_well/faq/about_us.dart';
import 'package:be_well/faq/faq_home.dart';
import 'package:be_well/faq/help.dart';
import 'package:be_well/home/controller/home_controller.dart';
import 'package:be_well/home/view/home.dart';
import 'package:be_well/myhomepage/view/myHomePage.dart';
import 'package:be_well/period/model/period_model.dart';
import 'package:be_well/period/view/period.dart';
import 'package:be_well/qrcode/view/qr_info_image.dart';
import 'package:be_well/qrcode/view/qrcode.dart';
import 'package:be_well/reminder/medicineReminder/model/medicine_reminder_model.dart';
import 'package:be_well/reminder/medicineReminder/view/medicine_reminder.dart';
import 'package:be_well/reminder/model/sleep_reminder_model.dart';
import 'package:be_well/reminder/reminderHome.dart';
import 'package:be_well/reminder/view/sleepReminder.dart';
import 'package:be_well/sleep/model/sleepMonitor_model.dart';
import 'package:be_well/sleep/view/sleep.dart';
import 'package:be_well/sleep/view/weekly_sleep_monitor.dart';
import 'package:be_well/upload/document/model/document_model.dart';
import 'package:be_well/upload/prescription/model/prescription_model.dart';
import 'package:be_well/upload/prescription/view/prescription.dart';
import 'package:be_well/upload/upload_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final applicationDocumentsDirectory =
      await getApplicationDocumentsDirectory();
  Hive.init(applicationDocumentsDirectory.path);

  Hive.registerAdapter(SleepMonitorModelAdapter());
  Hive.registerAdapter(SleepReminderModelAdapter());
  Hive.registerAdapter(MedicineReminderModelAdapter());
  Hive.registerAdapter(PeriodModelAdapter());
  Hive.registerAdapter(PrescriptionModelAdapter());
  Hive.registerAdapter(DocumentModelAdapter());

  await Hive.openBox<SleepMonitorModel>('SleepMonitor');
  await Hive.openBox<SleepReminderModel>('SleepReminder');
  await Hive.openBox<MedicineReminderModel>('MedicineReminder');
  await Hive.openBox<PeriodModel>('Period');
  await Hive.openBox<PrescriptionModel>('Prescription');
  await Hive.openBox<DocumentModel>('Document');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  AuthController authController = Get.put(AuthController());
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: <Locale>[Locale('en', 'US'), Locale('zh', 'CN')],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: authController.checkUserLoggedIn(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              } else if (snapshot.hasData) {
                // Extracting data from snapshot object
                final data = snapshot.data as bool;
                print('data is $data');
                if (data) {
                  return MyHomePage();
                } else {
                  return LoginOrSignup();
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
