import 'dart:io';
import 'dart:typed_data';

import 'package:be_well/home/model/user.dart';
import 'package:be_well/myhomepage/controller.dart/myhomepage_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class QrCodeController extends GetxController {
  Rx<bool> showQrCode = false.obs;
  String userId = "Usamabinsabir";
  Uint8List? bytes;
  Rx<bool> loading = false.obs;
  WidgetsToImageController widgetsToImageController =
      WidgetsToImageController();
  WidgetsToImageController infoToImageController = WidgetsToImageController();

  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  MyHomePageController myHomePageController = Get.find();

  checkIfQrCode() {
    if (myHomePageController.userInfo.value.userInfoLink.isEmpty) {
      showQrCode.value = false;
    } else {
      showQrCode.value = true;
    }
    print(showQrCode.value);
  }

  generateQrCode() async {
    loading.value = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    String docId = myHomePageController.userInfo.value.docId;
    showQrCode.value = true;
    await Future.delayed(Duration(seconds: 1));
    bytes = await infoToImageController.capture();
    print('bytes is $bytes');
    final tempDir = await getApplicationDocumentsDirectory();

    File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytesSync(bytes!);
    Reference ref = _firebaseStorage.ref().child(userId!);
    try {
      var a = await ref.putFile(file);
      var url = await _firebaseStorage.ref(ref.fullPath).getDownloadURL();

      await _firestore
          .collection('Users')
          .doc(docId)
          .update({"userInfoLink": url});

      myHomePageController.userInfo.value.userInfoLink = url;
      checkIfQrCode();
      loading.value = false;
      Get.back();
      print('value is ${myHomePageController.userInfo.value.userInfoLink}');
      print('url is $url');
    } catch (err) {
      print('posting qrimage $err');
    }
  }

  saveQrCodeToGallery() async {
    bytes = await widgetsToImageController.capture();
    final tempDir = await getApplicationDocumentsDirectory();
    File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytesSync(bytes!);
    await GallerySaver.saveImage(file.path).then((value) {
      print('value is $value');
    });
    Get.showSnackbar(GetSnackBar(
      duration: Duration(seconds: 3),
      title: 'Success',
      message: 'Qrcode save in gallery',
      backgroundColor: Colors.green as Color,
    ));
  }
}
