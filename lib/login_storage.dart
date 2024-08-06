import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';

class LoginStorage {
  final box = Hive.box('login_hive');

  static final LoginStorage _loginStorage = LoginStorage._internal();

  factory LoginStorage() {
    return _loginStorage;
  }

  LoginStorage._internal();

//! user auth token
  void setUserToken({required String token}) {
    log("user token in hive = $token");
    box.put("token", token);
  }

  String getUserToken() {
    return box.get("token");
  }

  void setIsLogin({required bool login}) {
    log("user login in hive = $login");
    box.put("login", login);
  }

  bool getIsLogin() {
    if (box.get('login') == null) {
      return false;
    }
    return box.get("login");
  }

  void setFacebookId({required String id}) {
    log("user id in hive = $id");
    box.put("id", id);
  }

  String? getFacebookId() {
    return box.get("id");
  }

  void setUserId({required String id}) {
    log("user id in hive = $id");
    box.put("id", id);
  }

  String? getUserId() {
    return box.get("id");
  }

  void setUserEmail({required String email}) {
    log("user id in hive = $email");
    box.put("email", email);
  }

  String getUserEmail() {
    return box.get("email");
  }

  void setUserName({required String fName}) {
    log("user fName in hive = $fName");
    box.put("fName", fName);
  }

  String getUserName() {
    return box.get("fName");
  }

  void setAdress({required String adress}) {
    log("user adress in hive = $adress");
    box.put("adress", adress);
  }

  String getAdress() {
    return box.get("adress");
  }

  void setPhone({required String phone}) {
    log("user phone in hive = $phone");
    box.put("phone", phone);
  }

  String? getPhone() {
    return box.get("phone");
  }

  void setRegisterDate({required String date}) {
    log("date in setRegisterDate = $date");
    box.put("date", date);
  }

  String? getRegisterDate() {
    return box.get("date");
  }

//! push notificatons device id
  void setUserDeviceId({required String deviceId}) {
    log("user deviceId in hive = $deviceId");
    box.put("deviceId", deviceId);
  }

  String getUserDeviceId() {
    return box.get("deviceId");
  }

  void setUserAvatar({required String avatar}) {
    log("user avatar in hive = $avatar");
    box.put("avatar", avatar);
  }

  String getUserAvatar() {
    return box.get("avatar");
  }

  void clearStorageData() {
    box.clear();
  }
}
