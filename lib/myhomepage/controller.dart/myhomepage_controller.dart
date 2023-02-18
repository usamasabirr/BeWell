import 'package:be_well/home/model/user.dart';
import 'package:be_well/myhomepage/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePageController extends GetxController {
  Rx<User> userInfo = User.empty().obs;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getUserInfo() async {
    print('Start: getUserInfo');
    User temp = User.empty();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? uid = sharedPreferences.getString('userId');
    var response = await _firestore
        .collection('Users')
        .where('userId', isEqualTo: uid)
        .get();

    temp.userInfoLink = '';

    temp.userId = response.docs[0]['userId'];
    temp.docId = response.docs[0]['docId'];
    temp.name = response.docs[0]['name'];
    temp.email = response.docs[0]['email'];
    temp.password = response.docs[0]['password'];
    temp.confirmPassword = response.docs[0]['confirmPassword'];
    temp.username = response.docs[0]['userName'];
    temp.dateOfBirth = response.docs[0]['dateOfBirth'];
    temp.allergies = response.docs[0]['allergies'];
    temp.diseases = response.docs[0]['diseases'];
    temp.weight = response.docs[0]['weight'];
    temp.bloodType = response.docs[0]['bloodType'];
    temp.height = response.docs[0]['height'];
    temp.gender = response.docs[0]['gender'];
    temp.friendNumber = response.docs[0]['familyNumber'];
    temp.friendName = response.docs[0]['familyName'];
    temp.doctorNumber = response.docs[0]['doctorNumber'];
    temp.doctorName = response.docs[0]['doctorName'];
    temp.userInfoLink = response.docs[0]['userInfoLink'];

    userInfo.value = temp;
  }
}
