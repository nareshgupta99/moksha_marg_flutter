import 'dart:convert';

import 'package:get/get.dart';
import 'package:moksha_marg/admin/dish/add_dish.dart';
import 'package:moksha_marg/admin/dish/edit_dish_view.dart';
import 'package:moksha_marg/admin/guides/guide_profile_view.dart';
import 'package:moksha_marg/admin/guides/guides_register_view.dart';
import 'package:moksha_marg/admin/profile/admin_profile.dart';
import 'package:moksha_marg/admin/restaurent/add_restaurent_details_view.dart';
import 'package:moksha_marg/admin/dish/dish_listing.dart';
import 'package:moksha_marg/admin/dish/update_dish.dart';
import 'package:moksha_marg/admin/restaurent/restaurent_profile.dart';
import 'package:moksha_marg/admin/temple/add_temple_view.dart';
import 'package:moksha_marg/admin/temple/temple_listing.dart';
import 'package:moksha_marg/app/authentication/forgot_password/forgot_password_view.dart';
import 'package:moksha_marg/app/authentication/login/login.dart';
import 'package:moksha_marg/app/authentication/registration/registration_view.dart';
import 'package:moksha_marg/app/authentication/reset_password/reset_password_view.dart';
import 'package:moksha_marg/app/authentication/verify_otp/verify_otp.dart';
import 'package:moksha_marg/app/cart/food_cart/food_cart_view.dart';
import 'package:moksha_marg/app/guides/guides_details_view.dart';
import 'package:moksha_marg/app/guides/guides_view.dart';
import 'package:moksha_marg/app/home/home_view.dart';
import 'package:moksha_marg/app/live_darshan/live_darshan_view.dart';
import 'package:moksha_marg/app/live_darshan/temple_view.dart';
import 'package:moksha_marg/app/navigation/temples_navigation_listing.dart';
import 'package:moksha_marg/app/profile/profile_view.dart';
import 'package:moksha_marg/app/profile/update_password.dart';
import 'package:moksha_marg/app/restaurent/restaurent_details/restaurent_details_view.dart';
import 'package:moksha_marg/app/restaurent/restaurent_view.dart';
import 'package:moksha_marg/network/response/add_dish.dart';
import 'package:moksha_marg/network/response/temple_data.dart';
import 'package:moksha_marg/splash/splash_view.dart';

class RoutesHelper {
  static const String _home = "/home";
  static const String _registration = "/registration";
  static const String _login = "/login";
  static const String _forgotPassword = "/forgot_password";
  static const String _resetPassword = "/reset_password";
  static const String _guides = "/guides";
  static const String _guidesDetails = "/guides_details";
  static const String _restaurent = "/restaurent";
  static const String _restaurentDetails = "/restaurent_details";
  static const String _temple = "/_temple";
  static const String _liveDarshan = "/live_darshan";
  static const String _foodCart = "/food_cart";
  static const String _profile = "/profile";
  static const String _splash = "/splash";
  static const String _verifyOtp = "/verify_otp";
  static const String _changedPassword = "/changed_password";
  static const String _addTemple = "/add_temple";
  static const String _addGuide = "/add_guide";
  static const String _guideProfile = "/guide_profile";

  //Restaurent Admin Routes
  static const String _addRestaurant = "/add_restaurant";
  static const String _editRestaurant = "/edit_restaurant";
  static const String _addDish = "/add_dish";
  static const String _editDish = "/edit_dish";
  static const String _updateDish = "/update_dish";
  static const String _dish = "/dish";
  static const String _dishListing = "/dish_listing";
  static const String _restaurentProfile = "/restaurent_profile";
  static const String _adminProfile = "/admin_profile";
  static const String _templeListing = "/temple_listing";
  static const String _templeNavigationListing = "/temple_navigation_listing";

  static String getHome() => _home;
  static String getRegistration() => _registration;
  static String getLogin() => _login;
  static String getForgotPassword() => _forgotPassword;
  static String getResetPassword({required String userId}) =>
      "$_resetPassword?id=$userId";
  static String getGuide() => _guides;
  static String getGuidesDetails({required String guideId}) =>
      "$_guidesDetails?id=$guideId";
  static String getRestaurent() => _restaurent;
  static String getRestaurentDetails({required String id}) =>
      "$_restaurentDetails?id=$id";
  static String getLiveDarshan({required TempleData temple}) {
    String encodeTemple =
        base64Url.encode(utf8.encode(jsonEncode(temple.toJson())));
    return "$_liveDarshan?temple=$encodeTemple";
  }

  static String getTemple() => _temple;
  static String getFoodCart() => _foodCart;
  static String getProfile() => _profile;
  static String getSplash() => _splash;
  static String getRestaurentProfile() => _restaurentProfile;
  static String getVerifyOtp({required String email, required String userId}) =>
      "$_verifyOtp?id=$userId&email=$email";

  static String getChangedPassword() => _changedPassword;
  static String getAdminProfile() => _adminProfile;
  static String getAddGuide() => _addGuide;
  static String getGuideProfile() => _guideProfile;
  static String getTempleNavigationListingCard() => _templeNavigationListing;

  //Restaurent Admin Routes

  static String getAddRestaurent() => _addRestaurant;
  static String getAddDish() => _addDish;
  static String getUpdateDish({required String id}) => "$_addDish?id=$id";
  static String getDishListing() => _dishListing;
  static String getEditDish({required DishData dish}) {
    String encodeDish =
        base64Url.encode(utf8.encode(jsonEncode(dish.toJson())));
    return "$_editDish?dish=$encodeDish";
  }

  static String getAddTemple() => _addTemple;
  static String getTempleListing() => _templeListing;

  static List<GetPage> routes = [
    GetPage(name: _home, page: () => HomeView()),
    GetPage(name: _registration, page: () => RegistrationView()),
    GetPage(name: _login, page: () => LoginView()),
    GetPage(name: _forgotPassword, page: () => ForgotPasswordView()),
    GetPage(
        name: _resetPassword,
        page: () => ResetPasswordView(
              userId: "${Get.parameters['id']}",
            )),
    GetPage(name: _guides, page: () => GuidesView()),
    GetPage(
        name: _guidesDetails,
        page: () => GuidesDetailsView(guideId: Get.parameters['id']!)),
    GetPage(name: _restaurent, page: () => RestaurentView()),
    GetPage(
        name: _restaurentDetails,
        page: () => RestaurentDetailsView(id: "${Get.parameters['id']}")),
    GetPage(name: _temple, page: () => TempleView()),
    GetPage(
        name: _liveDarshan,
        page: () => LiveDarshanView(
            temple: TempleData.fromJson(jsonDecode(
                utf8.decode(base64Url.decode(Get.parameters['temple']!)))))),
    GetPage(name: _foodCart, page: () => FoodCartView()),
    GetPage(name: _profile, page: () => ProfileView()),
    GetPage(name: _splash, page: () => SplashView()),
    GetPage(
        name: _verifyOtp,
        page: () => VerifyOtpView(
              userId: Get.parameters['id']!,
              email: Get.parameters['email']!,
            )),
    GetPage(name: _changedPassword, page: () => UpdatePasswordView()),

    //Restaurent Admin Routes

    GetPage(name: _addDish, page: () => AddDish()),
    GetPage(name: _templeNavigationListing, page: () => TemplesNavigationListing()),
    GetPage(name: _templeListing, page: () => TempleListingView()),
    GetPage(name: _adminProfile, page: () => AdminProfileView()),
    GetPage(name: _addTemple, page: () => AddTempleView()),
    GetPage(name: _dishListing, page: () => DishListing()),
    GetPage(name: _restaurentProfile, page: () => RestaurentProfileView()),
    GetPage(name: _addRestaurant, page: () => AddRestaurentDetailsView()),
    GetPage(name: _guideProfile, page: () => GuideProfileView()),
    GetPage(name: _addGuide, page: () => GuidesRegisterView()),
    GetPage(
        name: _updateDish, page: () => UpdateDish(id: Get.parameters['id']!)),
    GetPage(
        name: _editDish,
        page: () => EditDishView(
            dish: DishData.fromJson(jsonDecode(
                utf8.decode(base64Url.decode(Get.parameters['dish']!)))))),
  ];
}
