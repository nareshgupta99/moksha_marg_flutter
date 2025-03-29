import 'package:get/get.dart';
import 'package:moksha_marg/component/authentication/forgot_password/forgot_password_view.dart';
import 'package:moksha_marg/component/authentication/login/login.dart';
import 'package:moksha_marg/component/authentication/registration/view/registration_view.dart';
import 'package:moksha_marg/component/authentication/reset_password/reset_password_view.dart';
import 'package:moksha_marg/component/guides/guides_details_view.dart';
import 'package:moksha_marg/component/guides/guides_view.dart';
import 'package:moksha_marg/component/home/view/home_view.dart';

class RoutesHelper {
  static const String _home = "/home";
  static const String _registration = "/registration";
  static const String _login = "/login";
  static const String _forgotPassword = "/forgot_password";
  static const String _resetPassword = "/reset_password";
  static const String _guides = "/guides";
  static const String _guidesDetails = "/guides_details";

  static String getHome() => _home;
  static String getRegistration() => _registration;
  static String getLogin() => _login;
  static String getForgotPassword() => _forgotPassword;
  static String getResetPassword() => _resetPassword;
  static String getGuide() => _guides;
  static String getGuidesDetails() => _guidesDetails;

  static List<GetPage> routes = [
    GetPage(name: _home, page: () => HomeView()),
    GetPage(name: _registration, page: () => RegistrationView()),
    GetPage(name: _login, page: () => LoginView()),
    GetPage(name: _forgotPassword, page: () => ForgotPasswordView()),
    GetPage(name: _resetPassword, page: () => ResetPasswordView()),
    GetPage(name: _guides, page: () => GuidesView()),
    GetPage(name: _guidesDetails, page: () => GuidesDetailsView()),
  ];
}
