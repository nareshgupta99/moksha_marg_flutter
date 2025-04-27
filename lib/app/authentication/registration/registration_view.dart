import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/app/authentication/authentication_controller.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/dividers.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/social_links.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';

class RegistrationView extends StatefulWidget {
  RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  @override
  void initState() {
    super.initState();
    Get.find<AuthenticationController>().initRegister();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: topNavigaton(isLeading: true),
      backgroundColor: ColorsResources.backgroundColor,
      body: GetBuilder<AuthenticationController>(builder: (controler) {
        return Stack(
          children: [
            (controler.loading)
                ? Container(
                    color: Colors.black.withOpacity(0.04), // fade effect
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black.withOpacity(0.3),
                          color: Colors.black, // customize the color if needed
                          strokeWidth: 3,
                        ),
                      ),
                    ),
                  )
                : Text(""),
            SingleChildScrollView(child: _body(controler)),
          ],
        );
      }),
    );
  }

  Widget _body(AuthenticationController controler) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          heading(text: "Create Your account"),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: customTextField(
                textFieldLabel: "Full Name",
                controller: controler.registerNameController,
                hintText: "Enter your full name"),
          ),
          customTextField(
              textFieldLabel: "Email Address",
              controller: controler.registerEmailController,
              hintText: "Enter your email"),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: customDropDown(
                items: controler.roles,
                onChanged: (newValue) {
                  controler.setSelectedRole(value: newValue);
                },
                selected: controler.roles.contains(controler.selecedRole)
                    ? controler.selecedRole
                    : null,
                textFieldLabel: "Select Role"),
          ),
          customObsecureTextField(
              textFieldLabel: "Password",
              controller: controler.registerPasswordController,
              isObsecure: controler.registerPasswordObsecure,
              hintText: "Enter your password",
              onTap: controler.setRegisterPasswordObsecure),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: socialLogin(),
          ),
          customDividersWithText(text: "Or continue with"),
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 32),
            child: customButton(
                onPressed: () {
                  controler.registerWithValidation();
                },
                text: "Signup",
                width: Get.width),
          ),
          socialFooter(
              text1: "Already have an account?",
              text2: "Login",
              onTap: () => Get.back())
        ],
      ),
    );
  }
}
