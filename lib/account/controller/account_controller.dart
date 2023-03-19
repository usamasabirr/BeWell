import 'dart:typed_data';

import 'package:be_well/auth/view/login_or_signup.dart';
import 'package:be_well/myhomepage/controller.dart/myhomepage_controller.dart';
import 'package:be_well/myhomepage/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:firebase_auth/firebase_auth.dart' as FUser;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  MyHomePageController myHomePageController = Get.find();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User previousData = User.empty();
  Rx<bool> isLoading = false.obs;

  //edit
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  //edit continued
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
  DropdownEditingController bloodDropDownController =
      DropdownEditingController();

  setPreviousData() {
    previousData = myHomePageController.userInfo.value;

    nameController.text = previousData.name;
    usernameController.text = previousData.username;
    dateController.text = previousData.dateOfBirth;
    allergiesController.text = previousData.allergies;
    diseasesController.text = previousData.diseases;
    weightController.text = previousData.weight;
    bloodType = previousData.bloodType;
    bloodDropDownController.value = previousData.bloodType;
    heightController.text = previousData.height;
    genderType = previousData.gender;
    familyNameController.text = previousData.friendName;
    familyNumberController.text = previousData.friendNumber;
    doctorNameController.text = previousData.doctorName;
    doctorNumberController.text = previousData.doctorNumber;
    // if (previousData.dateOfBirth.isNotEmpty) {
    //   dateController.text = previousData.dateOfBirth;
    // }

    print('previousData is ${previousData.name} ');
    print('value is ${nameController.text}');
  }

  updateData() async {
    try {
      await _firestore.collection('Users').doc(previousData.docId).update({
        'name': nameController.text,
        //'email': emailController.text,
        'userName': usernameController.text,
        //'password': passwordController.text,
        //'confirmPassword': confirmPasswordController.text,
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
      await myHomePageController.getUserInfo();
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 3),
        title: 'Success',
        backgroundColor: Colors.green,
        message: 'Data updated successfully',
      ));
    } catch (err) {
      print('edit user infor error is $err');
    }
  }

  deleteAccount() async {
    isLoading.value = true;
    String email = myHomePageController.userInfo.value.email;
    String password = myHomePageController.userInfo.value.password;
    String userId = myHomePageController.userInfo.value.userId;
    print('emai is $email');
    print('password is $password');
    print(myHomePageController.userInfo.value);
    try {
      FUser.User user = await FUser.FirebaseAuth.instance.currentUser!;
      FUser.AuthCredential credentials =
          FUser.EmailAuthProvider.credential(email: email, password: password);

      print(credentials.accessToken);
      //print(user);
      FUser.UserCredential result =
          await user.reauthenticateWithCredential(credentials);
      //await _firestore.collection('User').doc(userId).delete();
      await result.user!.delete();
      isLoading.value = false;
      Get.offAll(LoginOrSignup());
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
        title: 'Success',
        message: 'account deleted successfully',
      ));
      return true;
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        title: 'Error',
        message: 'unable to delete account',
      ));
      return null;
    }
  }
}
