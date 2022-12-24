import 'package:be_well/home/model/user.dart';
import 'package:be_well/myhomepage/model/user.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyHomePageController extends GetxController {
  User userInfo = User.empty();

  Future<void> getUserInfo() async {
    print('Start: getUserInfo');
    userInfo.userInfoLink =
        'https://firebasestorage.googleapis.com/v0/b/bewell-ecf2e.appspot.com/o/Usamabinsabir?alt=media&token=f978c36c-da88-4edd-a270-0511b7fcf16b';
    userInfo.userId = "XtWW8phhI9QpGBuXYKfHVGG9XZ13";
    userInfo.name = "Usama";
    userInfo.email = "usamasabir4321@gmail.com";
    userInfo.password = "123456";
    userInfo.username = "_1234";
  }
}
