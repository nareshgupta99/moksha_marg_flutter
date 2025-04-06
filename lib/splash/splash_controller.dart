import 'dart:convert';

import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/util/local_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  SplashController({required this.sharedPreferences});

  void init() {
    Future.delayed(Duration.zero, () {
      Timer(const Duration(seconds: 2), () {
        String? loginData = sharedPreferences.getString(Keys.authData);
        String? guestData = sharedPreferences.getString(Keys.guestUuid);
        if (loginData != null || guestData != null) {
          // print("login DAta == $loginData");
          Get.offAllNamed(RoutesHelper.getHome());
        } else {
          Get.offAndToNamed(RoutesHelper.getLogin());
        }
      });
    });
  }
}
