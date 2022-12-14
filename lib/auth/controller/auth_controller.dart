import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthController extends GetxController {
  //text controller
  TextEditingController dateController = TextEditingController();
  String bloodType = '';
  List<String> bloodTypeDropDownValues = [
    "",
    "A+",
    "B+",
    "AB+",
    "A-",
    "B-",
    "AB-",
    "O+",
    "O-"
  ];
}
