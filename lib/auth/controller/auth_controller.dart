import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class AuthController extends GetxController {
  late UserCredential userCredential;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User user;
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;
  Rx<bool> loading = false.obs;

  //login
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  //sign up
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  //sign up continued
  String bloodType = '';
  Rx<bool> bloodTypeError = false.obs;
  String genderType = '';
  Rx<bool> genderTypeError = false.obs;
  TextEditingController allergiesController = TextEditingController();
  TextEditingController diseasesController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController familyNumberController = TextEditingController();
  TextEditingController familyNameController = TextEditingController();
  TextEditingController doctorNumberController = TextEditingController();
  TextEditingController doctorNameController = TextEditingController();

  Future<bool> registerWithEmailAndPassword() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    loading.value = true;
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      user = userCredential.user!;

      if (user == null) {
        //loading.value = false;
        print('cannot sign in with those credentials');
        return false;
      } else {
        try {
          var response = await _firestore.collection('Users').add({
            'userId': user.uid,
            'name': nameController.text,
            'email': emailController.text,
            'userName': usernameController.text,
            'password': passwordController.text,
            'confirmPassword': confirmPasswordController.text,
            'dateOfBirth': dateController.text,
            'bloodType': bloodType,
            'allergies': allergiesController.text,
            'diseases': diseasesController.text,
            'weight': weightController.text,
            'height': heightController.text,
            'gender': genderType,
            'familyNumber': familyNumberController.text,
            'familyName': familyNameController.text,
            'doctorNumber': doctorNumberController.text,
            'doctorName': doctorNameController.text,
            'userInfoLink': ''
          });
          await _firestore
              .collection('Users')
              .doc(response.id)
              .update({'docId': response.id});
          print('User Uploaded');
          await sharedPreferences.setBool('userLoggedIn', true);
          await sharedPreferences.setString('userId', user.uid);
          loading.value = false;
          return true;
        } catch (error) {
          loading.value = false;
          return false;
        }
      }
    } catch (error) {
      loading.value = false;
      print(error);
      var er = error.toString();
      var err = er.split(']');
      print('er is $er');
      print('err is ${err[1]}');
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 3),
        title: 'Error',
        message: '${err[1]}',
      ));
      return false;
    }
  }

  //singin
  Future<bool> logInWithEmailAndPassword() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    loading.value = true;
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: emailLoginController.text,
          password: passwordLoginController.text);

      await sharedPreferences.setBool('userLoggedIn', true);
      await sharedPreferences.setString('userId', userCredential.user!.uid);
      loading.value = false;
      return true;
    } catch (err) {
      //loading.value = false;
      Get.defaultDialog(title: 'Login Error', content: Text('$err'));
      print('signIN error is $err');
    }
    loading.value = false;
    return false;
  }

  Future<bool> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await _auth.signOut();
    sharedPreferences.remove('userId');
    sharedPreferences.remove('userLoggedIn');
    return true;
  }

  Future<bool> checkUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? userLoggedIn = sharedPreferences.getBool('userLoggedIn');
    if (userLoggedIn == null) {
      return false;
    }
    return true;
  }
}
