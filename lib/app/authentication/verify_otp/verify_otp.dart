import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:moksha_marg/app/authentication/authentication_controller.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/otp_field.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';

class VerifyOtpView extends StatefulWidget {
  String email;
  String userId;
  VerifyOtpView({super.key, required this.email, required this.userId});

  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  TextEditingController nameController = TextEditingController();

  TextEditingController registerPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: topNavigaton(isLeading: true),
      backgroundColor: ColorsResources.backgroundColor,
      body: SingleChildScrollView(child: _body()),
    );
  }

  Widget _body() {
    return GetBuilder<AuthenticationController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            heading(text: "Verify Otp"),
            RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  children: [
                    const TextSpan(
                        text:
                            "A 6-digit verification code has been sent to you via"),
                    TextSpan(
                        text: " ${widget.email} ",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    const TextSpan(
                        text: ", Please enter that to verify your account."),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: OtpFields(
                  onChanged: (value) {},
                  controllers: controller.verifyOtpControler),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 32),
              child: customButton(
                  onPressed: () {
                  context.loaderOverlay.show();
                    controller.verifyOtpWithValidation(userId: widget.userId,context: context);
                  },
                  text: "Submit",
                  width: Get.width),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Request a new verification code:",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: Dimensions.font14)),
                Obx(() => (controller.countDown.value != 0
                    ? Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Dimensions.font14),
                        "0${controller.countDown.value ~/ 60}: ${controller.countDown.value % 60}")
                    : GestureDetector(
                        onTap: () {
                          context.loaderOverlay.show();
                          controller.sendOtpWithValidation(email: widget.email,context: context);
                          Get.find<AuthenticationController>().startTimer();
                        },
                        child: Text("resend",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                                fontSize: Dimensions.font14))))),
              ],
            ),
          ],
        ),
      );
    });
  }
}
