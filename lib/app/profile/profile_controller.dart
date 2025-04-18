import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/app/profile/profile_dataservice.dart';
import 'package:moksha_marg/app/profile/profile_repository.dart';
import 'package:moksha_marg/app/profile/setting_model.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/response/login_data.dart';
import 'package:moksha_marg/util/local_keys.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class ProfileController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  final ProfileRepository repository;
  ProfileController(
      {required this.sharedPreferences, required this.repository});

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool oldPasswordObsecure = true;
  bool newPasswordObsecure = true;
  bool confirmPasswordObsecure = true;

  LoginData? user;

  List<Setting> userSettingItems = [
    Setting(name: "Change Password", icon: Icons.arrow_forward_ios),
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
      Setting(name: "Change Password", icon: Icons.arrow_forward_ios),
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

  void updatePassword() {
    if (oldPasswordController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Old Password is required');
    } else if (newPasswordController.text.trim().isEmpty) {
      Get.snackbar('Error', 'new password is required');
    } else if (confirmPasswordController.text.trim().isEmpty) {
      Get.snackbar('Error', 'confirm password is required');
    } else if (confirmPasswordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      Get.snackbar('Error', 'New Password and Confirm password must be same');
    } else {
      updateUserPassword();
    }
  }

  void getProfile() {
    getUserProfile();
  }

}
