import 'package:get/get.dart';
import 'package:moksha_marg/component/authentication/registration/view/registration.dart';
import 'package:moksha_marg/component/home/view/home.dart';

class RoutesHelper {
  static const String _home = "/home";
  static const String _registration = "/registration ";

  static String getHome() => _home;
  static String getRegistration() => _registration;

  static List<GetPage> routes = [
    GetPage(name: _home, page: () => Home()),
    GetPage(name: _registration, page: () => Registration())
  ];
}
