import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigaton(isLeading: true),
      backgroundColor: ColorsResources.backgroundColor,
      body: Center(child: SingleChildScrollView(child: _body())),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding16, vertical: Dimensions.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          heading(text: "Forgot Password?"),
          Padding(
            padding: EdgeInsets.only(
                top: Dimensions.padding32, bottom: Dimensions.padding16),
            child: customTextField(
                textFieldLabel: "Email Address",
                controller: nameController,
                hintText: "Enter your email"),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Dimensions.padding16, bottom: Dimensions.padding32),
            child:
                customButton(onPressed: () {}, text: "Login", width: Get.width),
          ),
          socialFooter(
              text1: "",
              text2: "Go Back",
              onTap: () {
                Get.back();
              })
        ],
      ),
    );
  }
}
