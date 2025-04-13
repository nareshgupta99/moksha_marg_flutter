import 'package:get/get.dart';
import 'package:moksha_marg/admin/restaurent/restarant_controller.dart';
import 'package:moksha_marg/admin/restaurent/restaurent_repository.dart';
import 'package:moksha_marg/app/authentication/auth_repository.dart';
import 'package:moksha_marg/app/authentication/authentication_controller.dart';
import 'package:moksha_marg/app/profile/profile_controller.dart';
import 'package:moksha_marg/bootom_navigation_controller.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/network/network_manager.dart';
import 'package:moksha_marg/splash/splash_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreference);
  Get.lazyPut(() => NetworkManager());
  Get.lazyPut(() => AuthenticationRepository(network: Get.find()));
  Get.lazyPut(() => RestaurentRepository (network: Get.find()));


  Get.lazyPut(() => SplashController(sharedPreferences:sharedPreference));
  Get.lazyPut(() => AuthenticationController(sharedPreferences: sharedPreference,repository: Get.find()));
  Get.lazyPut(() => BootomNavigationController());
  Get.lazyPut(() => ProfileController(sharedPreferences: sharedPreference));
  Get.lazyPut(() => RestarantController(repository: Get.find()));
  Get.lazyPut(() => FilePickerController());
  
}
