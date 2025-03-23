import 'package:get/get.dart';
import 'package:moksha_marg/component/authentication/login/login.dart';
import 'package:moksha_marg/component/authentication/registration/view/registration_view.dart';
import 'package:moksha_marg/component/home/view/home_view.dart';

class RoutesHelper {
  static const String _home = "/home";
  static const String _registration = "/registration ";
  static const String _login = "/login ";

  static String getHome() => _home;
  static String getRegistration() => _registration;
  static String getLogin() => _login;

  static List<GetPage> routes = [
    GetPage(name: _home, page: () => HomeView()),
    GetPage(name: _registration, page: () => RegistrationView()),
    GetPage(name: _login, page: () => LoginView())
  ];
}
