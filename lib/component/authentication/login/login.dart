import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/dividers.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/social_links.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  List<String> items = [
    "visitors",
    "restaurent partner",
    "hotel partner",
    "guide"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigaton(),
      backgroundColor: ColorsResources.backgroundColor,
      body: Center(child: SingleChildScrollView(child: _body())),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          heading(text: "Login to Your account"),
          Padding(
            padding: EdgeInsets.only(top: 32,bottom: 16),
            child: customTextField(
                textFieldLabel: "Email Address",
                controller: nameController,
                hintText: "Enter your email"),
          ),
          customObsecureTextField(
              textFieldLabel: "Password",
              controller: registerPasswordController,
              hintText: "Enter your password"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: socialLogin(),
          ),
          customDividersWithText(text: "Or continue with"),
          Padding(
            padding:  EdgeInsets.only(top:16,bottom: 32),
            child: customButton(onPressed: () {}, text: "Login", width: Get.width),
          ),
          socialFooter( text1: "Don't have an account?", text2: "Sign up", onTap: () {})
        ],
      ),
    );
  }
}
