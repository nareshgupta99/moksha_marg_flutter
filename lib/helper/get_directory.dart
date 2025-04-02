import 'package:get/get.dart';
import 'package:moksha_marg/app/authentication/authentication_controller.dart';
import 'package:moksha_marg/bootom_navigation_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreference);
  Get.lazyPut(() => AuthenticationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => BootomNavigationController());
}
