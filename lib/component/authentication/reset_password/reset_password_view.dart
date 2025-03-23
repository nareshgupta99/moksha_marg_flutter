import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/dividers.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/social_links.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();

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
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          heading(text: "Update Password"),
          Padding(
            padding: const EdgeInsets.only(top: 32,bottom: 16),
            child: customObsecureTextField(
              textFieldLabel: "Password",
              controller: registerPasswordController,
              hintText: "Enter new password",
            ),
          ),
           customObsecureTextField(
            textFieldLabel: "Confirm Password",
            controller: registerPasswordController,
            hintText: "Enter confirm password",
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 32),
            child:
                customButton(onPressed: () {}, text: "Update", width: Get.width),
          ),
          socialFooter(
              text1: "", text2: "Go Back", onTap: () {})
        ],
      ),
    );
  }
}
