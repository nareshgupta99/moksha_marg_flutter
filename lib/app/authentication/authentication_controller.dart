import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/util/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController implements GetxService {
  // final AuthenticationRepository repository;
  final SharedPreferences sharedPreferences;
  AuthenticationController({ required this.sharedPreferences});

  bool loading = true;

  bool registerPasswordObsecure = true;
  bool loginPasswordObsecure = true;
  bool resetPasswordObsecure = true;
  bool resetconfirmResetPasswordObsecure = true;

  var loginEmailController = TextEditingController();
  var loginPasswordController = TextEditingController();

  String? dialCode = '91';
  var registerNameController = TextEditingController();
  var registerEmailController = TextEditingController();
  var registerPhoneController = TextEditingController();
  var registerPasswordController = TextEditingController();

  var forgotEmailController = TextEditingController();

  var resetPasswordController = TextEditingController();
  var resetConfirmPasswordController = TextEditingController();

  List<TextEditingController> verifyOtpControler =
      List.generate(6, (index) => TextEditingController());

  void initLogin() {
    loginEmailController = TextEditingController();
    loginPasswordController = TextEditingController();
    loginPasswordObsecure = true;
  }

  void initRegister() {
    dialCode = '91';
    registerNameController = TextEditingController();
    registerEmailController = TextEditingController();
    registerPhoneController = TextEditingController();
    registerPasswordController = TextEditingController();
    registerPasswordObsecure = true;
  }

  void initForgot() {
    forgotEmailController = TextEditingController();
  }

  void initResetPassword() {
    resetPasswordObsecure = true;
    resetconfirmResetPasswordObsecure = true;
    resetPasswordController = TextEditingController();
    resetConfirmPasswordController = TextEditingController();
  }

  var countDown = 0.obs;
  late Timer timer;

  void startTimer() {
    countDown = 10.obs;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (countDown.value == 0) {
        timer.cancel();
      } else {
        countDown.value--;
      }
    });
  }

  void initVerifyOtp() {
    verifyOtpControler = List.generate(6, (index) => TextEditingController());
    countDown = 0.obs;
  }

  void setDialCode(String? value) {
    dialCode = value;
    update();
  }

  void setLoginPasswordObsecure() {
    loginPasswordObsecure = !loginPasswordObsecure;
    update();
  }

  void setRegisterPasswordObsecure() {
    registerPasswordObsecure = !registerPasswordObsecure;
    update();
  }

  void setVerifyOtpController() {
    update();
  }

  void setResetPasswordObsecure() {
    resetPasswordObsecure = !resetPasswordObsecure;
    update();
  }

  void setResetconfirmResetPasswordObsecure() {
    resetconfirmResetPasswordObsecure = !resetconfirmResetPasswordObsecure;
    update();
  }

  void loginWithValidaion() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (loginEmailController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Email is required');
    } else if (!loginEmailController.text.trim().isValidEmail()) {
      Get.snackbar('Error', 'Enter valid email');
    } else if (loginPasswordController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Password is required');
    } else {
      // login();
    }
  }

  void registerWithValidation() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (registerNameController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Name is required');
    } else if (registerEmailController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Email is required');
    } else if (!registerEmailController.text.trim().isValidEmail()) {
      Get.snackbar('Error', 'Enter valid email');
    } else if (registerPasswordController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Password is required');
    } else if (registerPasswordController.text.trim().isInvalidPassword()) {
      Get.snackbar(
          'Error', 'Entered password must be at least 8 characters long');
    } else {
      // register();
    }
  }

  void sendOtpWithValidation({String? email}) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (forgotEmailController.text.trim().isEmpty &&
        (email == null || email.trim().isEmpty)) {
      Get.snackbar('Error', 'Email is required');
    } else if (!forgotEmailController.text.trim().isValidEmail() &&
        (email == null || !email.isValidEmail())) {
      Get.snackbar('Error', 'Enter valid email');
    } else {
      // sendOtp(email: email);
    }
  }

  String otp = "";
  void verifyOtpWithValidation({required String userId}) {
    otp = "";
    verifyOtpControler.forEach((val) => otp = otp + val.text.trim());
    // debugConsole("userid aur=th contr: $userId");
    if (otp.isEmpty) {
      Get.snackbar('Error', 'Otp is required');
    } else if (!otp.isValidOtp()) {
      Get.snackbar(
          'Error', 'Entered password must be at least 6 characters long');
    } else {
      // debugConsole(otp);?
    }
  }

  void resetPasswordWithValidation({required String userId}) {
    FocusManager.instance.primaryFocus?.unfocus();
    // debugConsole("pass: ${resetPasswordController.text} confirm: ${resetConfirmPasswordController.text}");
    if (resetPasswordController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Password is required');
    } else if (resetConfirmPasswordController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Confirm password is required');
    } else if (resetPasswordController.text.trim() !=
        resetConfirmPasswordController.text.trim()) {
      Get.snackbar('Error', 'Password and Confirm password must be same');
    } else {
      // resetPassword(userId: userId);
    }
  }

  // void deleteAuth() async {
  //   sharedPreferences.remove(Keys.authData);
  //   sharedPreferences.remove(Keys.guestUuid);
  //   Get.offAndToNamed(RoutesHelper.getSplash());
  // }

  // Future<void> setAuthData(LoginData? data) async {
  //   try {
  //     await sharedPreferences.setString(Keys.authData, jsonEncode(data!.toJson()));
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // LoginData? getAuthdata() {
  //   LoginData? authPref;
  //   if (_getAuthData() != '') authPref = LoginData.fromJson(jsonDecode(_getAuthData()));
  //   return authPref;
  // }

  // String _getAuthData() => sharedPreferences.getString(Keys.authData) ?? '';
}
