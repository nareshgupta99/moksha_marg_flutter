import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:moksha_marg/app/authentication/authentication_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';

class ResetPasswordView extends StatefulWidget {
  String userId;
  ResetPasswordView({super.key, required this.userId});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  @override
  void initState() {
    super.initState();
    Get.find<AuthenticationController>().initResetPassword();
  }

  @override
  Widget build(BuildContext context) {
    print("userId:: ${widget.userId}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: topNavigaton(isLeading: true),
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
            heading(text: "please Enter new Password"),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: customObsecureTextField(
                  textFieldLabel: "Password",
                  controller: controller.resetPasswordController,
                  hintText: "Enter your password",
                  isObsecure: controller.resetPasswordObsecure,
                  onTap: () => controller.setResetPasswordObsecure()),
            ),
            customObsecureTextField(
                textFieldLabel: "Confirm Password",
                controller: controller.resetConfirmPasswordController,
                hintText: "Enter your password",
                isObsecure: controller.resetconfirmResetPasswordObsecure,
                onTap: () => controller.setResetconfirmResetPasswordObsecure()),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 32),
              child: customButton(
                  onPressed: () {
                    context.loaderOverlay.show();
                    controller.resetPasswordWithValidation(
                        userId: widget.userId, context: context);
                  },
                  text: "Submit",
                  width: double.infinity),
            ),
          ],
        ),
      );
    });
  }
}
