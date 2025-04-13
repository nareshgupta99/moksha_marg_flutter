import 'dart:convert';

import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/response/login_data.dart';
import 'package:moksha_marg/util/local_keys.dart';
import 'package:moksha_marg/util/local_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  SplashController({required this.sharedPreferences});

  void init() {
    // sharedPreferences.clear();
    Future.delayed(Duration.zero, () {
      Timer(const Duration(seconds: 2), () {
        String? loginData = sharedPreferences.getString(Keys.authData);
        if (loginData != null) {
          var data = jsonDecode(loginData);
          LoginData decodeLoginData = LoginData.fromJson(data);
          if (decodeLoginData.roles == Role.VISITOR.name) {
            Get.offAllNamed(RoutesHelper.getHome());
          }
          if (decodeLoginData.roles == Role.RESTAURENT_OWNER.name) {
            Get.offAllNamed(RoutesHelper.getAddRestaurent());
          }
        } else {
          Get.offAndToNamed(RoutesHelper.getLogin());
        }
      });
    });
  }
}
