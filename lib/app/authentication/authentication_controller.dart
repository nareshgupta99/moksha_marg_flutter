import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/app/authentication/auth_dataservice.dart';
import 'package:moksha_marg/app/authentication/auth_repository.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/response/auth_data.dart';
import 'package:moksha_marg/network/response/login_data.dart';
import 'package:moksha_marg/util/extensions.dart';
import 'package:moksha_marg/util/local_keys.dart';
import 'package:moksha_marg/util/local_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController implements GetxService {
  final AuthenticationRepository repository;
  final SharedPreferences sharedPreferences;
  AuthenticationController(
      {required this.sharedPreferences, required this.repository});

  bool loading = false;

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
  List<String> roles = [
    "SELECT ROLE",
    Role.VISITOR.name,
    Role.HOTEL_OWNER.name,
    Role.GUIDE.name,
    Role.RESTAURENT_OWNER.name
  ];
  String selecedRole = "SELECT ROLE";

  var forgotEmailController = TextEditingController();

  var resetPasswordController = TextEditingController();
  var resetConfirmPasswordController = TextEditingController();

  AuthData? authData;

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
    roles = [
      "SELECT ROLE",
      Role.VISITOR.name,
      Role.HOTEL_OWNER.name,
      Role.GUIDE.name,
      Role.RESTAURENT_OWNER.name
    ];
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
    countDown = 120.obs;
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

  void loginWithValidaion({required BuildContext context}) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (loginEmailController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Email is required');
    } else if (!loginEmailController.text.trim().isValidEmail()) {
      Get.snackbar('Error', 'Enter valid email');
    } else if (loginPasswordController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Password is required');
    } else {
      loading = true;
      login(context:context);
    }
  }

  void registerWithValidation({required BuildContext context}) {
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
    } else if (selecedRole.trim().isEmpty ||
        selecedRole.trim() == "SELECT ROLE") {
      Get.snackbar('Error', 'Role is required');
    } else {
      loading = true;
      // update();
      register(context);
    }
  }

  void sendOtpWithValidation({required BuildContext context, String? email}) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (forgotEmailController.text.trim().isEmpty &&
        (email == null || email.trim().isEmpty)) {
      Get.snackbar('Error', 'Email is required');
    } else if (!forgotEmailController.text.trim().isValidEmail() &&
        (email == null || !email.isValidEmail())) {
      Get.snackbar('Error', 'Enter valid email');
    } else {
      loading = true;
      sendOtp(email: email,context:context);
    }
  }

  String otp = "";

  void verifyOtpWithValidation({required BuildContext context,required String userId}) {
    otp = "";
    for (var val in verifyOtpControler) {
      otp = otp + val.text.trim();
    }
    // debugConsole("userid aur=th contr: $userId");
    if (otp.isEmpty) {
      Get.snackbar('Error', 'Otp is required');
    } else if (!otp.isValidOtp()) {
      Get.snackbar(
          'Error', 'Entered password must be at least 6 characters long');
    } else {
      // debugConsole(otp);
      loading = true;
      verifyOtp(userId: userId, otp: otp,context:context);
    }
  }

  void resetPasswordWithValidation({required BuildContext context,required String userId}) {
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
      loading = true;
      resetPassword(userId: userId,context:context);
    }
  }

  void setSelectedRole({String? value}) {
    selecedRole = value ?? roles[0];
    update();
  }

  // void deleteAuth() async {
  //   sharedPreferences.remove(Keys.authData);
  //   sharedPreferences.remove(Keys.guestUuid);
  //   Get.offAndToNamed(RoutesHelper.getSplash());
  // }

  Future<void> setAuthData(LoginData? data) async {
    try {
      await sharedPreferences.setString(
          Keys.bearerToken, jsonEncode(data!.token));
      await sharedPreferences.setString(
          Keys.authData, jsonEncode(data.toJson()));
      if (data.restaurantId != null) {
        await sharedPreferences.setString(
            Keys.restaurentId, data.restaurantId.toString());
      }
    } catch (e) {
      rethrow;
    }
  }

  // LoginData? getAuthdata() {
  //   LoginData? authPref;
  //   if (_getAuthData() != '') authPref = LoginData.fromJson(jsonDecode(_getAuthData()));
  //   return authPref;
  // }

  // String _getAuthData() => sharedPreferences.getString(Keys.authData) ?? '';

  void secureRoutes(LoginData decodeLoginData) {
    if (decodeLoginData.roles == Role.VISITOR.name) {
      Get.offAllNamed(RoutesHelper.getHome());
    } else if (decodeLoginData.roles == Role.RESTAURENT_OWNER.name) {
      if (decodeLoginData.restaurantId == null) {
        Get.offAllNamed(RoutesHelper.getAddRestaurent());
      } else {
        Get.offAllNamed(RoutesHelper.getDishListing());
      }
    } else if (decodeLoginData.roles == Role.ADMIN.name) {
      Get.offAllNamed(RoutesHelper.getAddTemple());
    } else {
      Get.offAndToNamed(RoutesHelper.getLogin());
    }
  }
}
