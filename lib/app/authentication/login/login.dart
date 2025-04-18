import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/app/authentication/authentication_controller.dart';
import 'package:moksha_marg/bootom_navigation_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/dividers.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/social_links.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    Get.find<AuthenticationController>().initLogin();
    Get.find<BootomNavigationController>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: topNavigaton(isLeading: false),
      backgroundColor: ColorsResources.backgroundColor,
      body: Center(child: SingleChildScrollView(child: _body())),
    );
  }

  Widget _body() {
    return GetBuilder<AuthenticationController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            heading(text: "Login to Your account"),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: customTextField(
                  textFieldLabel: "Email Address",
                  controller: controller.loginEmailController,
                  hintText: "Enter your email"),
            ),
            customObsecureTextField(
                textFieldLabel: "Password",
                controller: controller.loginPasswordController,
                hintText: "Enter your password",
                isObsecure: controller.loginPasswordObsecure,
                onTap: () => controller.setLoginPasswordObsecure()),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Get.toNamed(RoutesHelper.getForgotPassword()),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("forgot password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: socialLogin(),
            ),
            customDividersWithText(text: "Or continue with"),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 32),
              child: customButton(
                  onPressed: () {
                    // Get.offAllNamed(RoutesHelper.getHome());
                    controller.loginWithValidaion();
                  },
                  text: "Login",
                  width: double.infinity),
            ),
            socialFooter(
                text1: "Don't have an account?",
                text2: "Sign up",
                onTap: () {
                  Get.toNamed(RoutesHelper.getRegistration());
                })
          ],
        ),
      );
    });
  }
}
