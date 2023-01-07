class User {
  late String userId;
  late String docId;
  late String userInfoLink;
  late String name;
  late String email;
  late String username;
  late String password;
  late String confirmPassword;
  late String dateOfBirth;
  late String bloodType;
  late String allergies;
  late String diseases;
  late String weight;
  late String height;
  late String gender;
  late String friendName;
  late String friendNumber;
  late String doctorName;
  late String doctorNumber;

  User(
      {userId,
      docId,
      userInfoLink,
      name,
      email,
      username,
      passowrd,
      confirmPassword,
      dateOfBirth,
      bloodType,
      allergies,
      diseases,
      weight,
      height,
      gender,
      friendName,
      friendNumber,
      doctorName,
      doctorNumber});

  User.empty() {
    userId:
    '';
    docId:
    '';
    userInfoLink:
    '';
    name:
    '';
    email:
    '';
    username:
    '';
    password:
    '';
    confirmPassword:
    '';
    dateOfBirth:
    '';
    bloodType:
    '';
    allergies:
    '';
    diseases:
    '';
    weight:
    '';
    height:
    '';
    gender:
    '';
    friendName:
    '';
    friendNumber:
    '';
    doctorName:
    '';
    doctorNumbr:
    '';
  }
}
