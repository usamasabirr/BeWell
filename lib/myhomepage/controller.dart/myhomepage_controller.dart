import 'package:be_well/home/model/user.dart';
import 'package:be_well/myhomepage/model/user.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyHomePageController extends GetxController {
  User userInfo = User.empty();

  Future<void> getUserInfo() async {
    print('Start: getUserInfo');
    userInfo.userInfoLink = '';
    userInfo.userId = "XtWW8phhI9QpGBuXYKfHVGG9XZ13";
    userInfo.docId = "ZRSUxSPJtDotfdnB6BtR";
    userInfo.name = "Usama";
    userInfo.email = "usamasabir4321@gmail.com";
    userInfo.password = "123456";
    userInfo.confirmPassword = "";
    userInfo.username = "_1234";
    userInfo.dateOfBirth = "22-10-2022";
    userInfo.allergies = "Skin Rash";
    userInfo.diseases = '';
    userInfo.weight = '';
    userInfo.bloodType = 'AB+';
    userInfo.height = '';
    userInfo.gender = 'Male';
    userInfo.friendNumber = '';
    userInfo.friendName = 'Ahmed';
    userInfo.doctorNumber = '';
    userInfo.doctorName = 'Shaukat';
  }
}
