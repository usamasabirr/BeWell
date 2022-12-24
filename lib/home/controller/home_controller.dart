import 'package:be_well/home/model/user.dart';
import 'package:be_well/myhomepage/model/user.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  User userInfo = User.empty();

  Future<void> getUserInfo() async {
    userInfo.name = "Usama";
    userInfo.email = "usamasabir4321@gmail.com";
    userInfo.password = "123456";
    userInfo.username = "_1234";
  }
}
