import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:moksha_marg/app/authentication/authentication_controller.dart';
import 'package:moksha_marg/app/profile/profile_controller.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';

class UpdatePasswordView extends StatefulWidget {
  UpdatePasswordView({super.key});

  @override
  State<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends State<UpdatePasswordView> {
  @override
  void initState() {
    super.initState();
    Get.find<ProfileController>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigaton(isLeading: true),
      backgroundColor: ColorsResources.backgroundColor,
      body: Center(child: SingleChildScrollView(child: _body())),
    );
  }

  Widget _body() {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            heading(text: "Update Password"),
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.padding32, bottom: Dimensions.padding16),
              child: customObsecureTextField(
                  textFieldLabel: "Old Password",
                  controller: controller.oldPasswordController,
                  hintText: "Enter Old password",
                  isObsecure: controller.oldPasswordObsecure,
                  onTap: () => controller.setOldPasswordObsecure()),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimensions.padding16),
              child: customObsecureTextField(
                  textFieldLabel: "New Password",
                  controller: controller.newPasswordController,
                  hintText: "Enter new password",
                  isObsecure: controller.newPasswordObsecure,
                  onTap: () => controller.setNewPasswordObsecure()),
            ),
            customObsecureTextField(
                textFieldLabel: "Confirm Password",
                controller: controller.confirmPasswordController,
                hintText: "Enter Confirm password",
                isObsecure: controller.confirmPasswordObsecure,
                onTap: () => controller.setConfirmPasswordObsecure()),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 32),
              child: customButton(
                  onPressed: () {
                    context.loaderOverlay.show();
                    controller.updatePassword(context: context);
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
