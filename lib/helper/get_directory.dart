import 'package:get/get.dart';
import 'package:moksha_marg/admin/dish/dish_controller.dart';
import 'package:moksha_marg/admin/dish/dish_repository.dart';
import 'package:moksha_marg/admin/guides/guide_repository.dart';
import 'package:moksha_marg/admin/guides/guides_controller.dart';
import 'package:moksha_marg/admin/restaurent/restarant_controller.dart';
import 'package:moksha_marg/admin/restaurent/restaurent_repository.dart';
import 'package:moksha_marg/admin/temple_controller.dart';
import 'package:moksha_marg/admin/temple_repository.dart';
import 'package:moksha_marg/app/authentication/auth_repository.dart';
import 'package:moksha_marg/app/authentication/authentication_controller.dart';
import 'package:moksha_marg/app/cart/food_cart_controller.dart';
import 'package:moksha_marg/app/cart/food_cart_repository.dart';
import 'package:moksha_marg/app/cart/order_cart_controller.dart';
import 'package:moksha_marg/app/cart/order_cart_repository.dart';
import 'package:moksha_marg/app/profile/profile_controller.dart';
import 'package:moksha_marg/app/profile/profile_repository.dart';
import 'package:moksha_marg/bootom_navigation_controller.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/map_controller.dart';
import 'package:moksha_marg/network/network_manager.dart';
import 'package:moksha_marg/splash/splash_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreference);
  Get.lazyPut(() => NetworkManager());
  Get.lazyPut(() => AuthenticationRepository(network: Get.find()));
  Get.lazyPut(() => RestaurentRepository (network: Get.find()));
  Get.lazyPut(() => DishRepository(network: Get.find()));
  Get.lazyPut(() => FoodCartRepository(network: Get.find()));
  Get.lazyPut(() => OrderCartRepository(network: Get.find()));
  Get.lazyPut(() => TempleRepository(network: Get.find()));
  Get.lazyPut(() => ProfileRepository(network: Get.find()));
  Get.lazyPut(() => GuideRepository(network: Get.find()));




  Get.lazyPut(() => SplashController(sharedPreferences:sharedPreference));
  Get.lazyPut(() => AuthenticationController(sharedPreferences: sharedPreference,repository: Get.find()));
  Get.lazyPut(() => BootomNavigationController());
  Get.lazyPut(() => ProfileController(sharedPreferences: sharedPreference,repository: Get.find()));
  Get.lazyPut(() => RestarantController(repository: Get.find()));
  Get.lazyPut(() => FilePickerController());
  Get.lazyPut(() => DishController(repository: Get.find(),sharedPrefrence: sharedPreference));
  Get.lazyPut(() => FoodCartController(sharedPreferences: sharedPreference,repository: Get.find()));
  Get.lazyPut(() => OrderCartController(sharedPreferences: sharedPreference,repository: Get.find()));
  Get.lazyPut(() => TempleController(repository: Get.find()));
  Get.lazyPut(() => GuidesController(repository: Get.find()));
  Get.lazyPut(() => MapController());



  
}
