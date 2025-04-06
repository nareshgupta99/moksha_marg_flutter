import 'package:get/get.dart';
import 'package:moksha_marg/admin/restaurent/add_dish.dart';
import 'package:moksha_marg/admin/restaurent/update_dish.dart';
import 'package:moksha_marg/app/authentication/forgot_password/forgot_password_view.dart';
import 'package:moksha_marg/app/authentication/login/login.dart';
import 'package:moksha_marg/app/authentication/registration/registration_view.dart';
import 'package:moksha_marg/app/authentication/reset_password/reset_password_view.dart';
import 'package:moksha_marg/app/cart/food_cart/food_cart_view.dart';
import 'package:moksha_marg/app/guides/guides_details_view.dart';
import 'package:moksha_marg/app/guides/guides_view.dart';
import 'package:moksha_marg/app/home/home_view.dart';
import 'package:moksha_marg/app/live_darshan/live_darshan_view.dart';
import 'package:moksha_marg/app/live_darshan/temple_view.dart';
import 'package:moksha_marg/app/profile/profile_view.dart';
import 'package:moksha_marg/app/restaurent/restaurent_details/restaurent_details_view.dart';
import 'package:moksha_marg/app/restaurent/restaurent_view.dart';

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


  //Restaurent Admin Routes
  static const String _addDish = "/add_dish";
  static const String _updateDish = "/update_dish";
  static const String _dish = "/dish";





  static String getHome() => _home;
  static String getRegistration() => _registration;
  static String getLogin() => _login;
  static String getForgotPassword() => _forgotPassword;
  static String getResetPassword() => _resetPassword;
  static String getGuide() => _guides;
  static String getGuidesDetails() => _guidesDetails;
  static String getRestaurent() => _restaurent;
  static String getRestaurentDetails() => _restaurentDetails;
  static String getLiveDarshan({required String  id}) => "$_liveDarshan?id=$id";
  static String getTemple() => _temple;
  static String getFoodCart() => _foodCart;
  static String getProfile() => _profile;

  //Restaurent Admin Routes


  static String getAddDish() => _addDish;
  static String getUpdateDish({required String  id}) => "$_addDish?id=$id";

  static List<GetPage> routes = [
    GetPage(name: _home, page: () => HomeView()),
    GetPage(name: _registration, page: () => RegistrationView()),
    GetPage(name: _login, page: () => LoginView()),
    GetPage(name: _forgotPassword, page: () => ForgotPasswordView()),
    GetPage(name: _resetPassword, page: () => ResetPasswordView()),
    GetPage(name: _guides, page: () => GuidesView()),
    GetPage(name: _guidesDetails, page: () => GuidesDetailsView()),
    GetPage(name: _restaurent, page: () => RestaurentView()),
    GetPage(name: _restaurentDetails, page: () => RestaurentDetailsView()),
    GetPage(name: _temple, page: () => TempleView()),
    GetPage(name: _liveDarshan, page: () => LiveDarshanView(id:Get.parameters['id']!)),
    GetPage(name: _foodCart, page: () => FoodCartView()),
    GetPage(name: _profile, page: () => ProfileView()),

  //Restaurent Admin Routes


    GetPage(name: _addDish, page: () => AddDish()),
    GetPage(name: _updateDish, page: () => UpdateDish(id:Get.parameters['id']!)),
  ];
}
