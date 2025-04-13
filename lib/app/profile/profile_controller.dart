import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/app/profile/setting_model.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/util/local_keys.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class ProfileController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  ProfileController({required this.sharedPreferences});

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool oldPasswordObsecure = true;
  bool newPasswordObsecure = true;
  bool confirmPasswordObsecure = true;

  List<Setting> userSettingItems = [
    Setting(name: "Privacy", icon: Icons.arrow_forward_ios),
    Setting(name: "Help & Support", icon: Icons.arrow_forward_ios),
    Setting(name: "Language", icon: Icons.arrow_forward_ios),
    Setting(name: "Logout", icon: Icons.logout_outlined),
  ];

 

  void init() {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    oldPasswordObsecure = true;
    newPasswordObsecure = true;
    confirmPasswordObsecure = true;
    userSettingItems = [
    Setting(name: "Privacy", icon: Icons.arrow_forward_ios),
    Setting(name: "Help & Support", icon: Icons.arrow_forward_ios),
    Setting(name: "Language", icon: Icons.arrow_forward_ios),
    Setting(name: "Logout", icon: Icons.logout_outlined),
  ];
  }

  
  void deleteAuth() async {
    await sharedPreferences.remove(Keys.authData);
    await sharedPreferences.remove(Keys.bearerToken);
    Get.offAndToNamed(RoutesHelper.getSplash());
  }

  void setOldPasswordObsecure() {
    oldPasswordObsecure = !oldPasswordObsecure;
    update();
  }

  void setNewPasswordObsecure() {
    newPasswordObsecure = !newPasswordObsecure;
    update();
  }

  void setConfirmPasswordObsecure() {
    confirmPasswordObsecure = !confirmPasswordObsecure;
    update();
  }

  

 
}
