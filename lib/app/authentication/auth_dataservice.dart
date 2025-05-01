import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:moksha_marg/app/authentication/authentication_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/util/custom_enum.dart';

extension AuthenticationDataService on AuthenticationController {
  Future<void> login({required BuildContext context}) async {
    loading = true;
    var authPayload = AuthPayload();
    authPayload.email = loginEmailController.text.trim();
    authPayload.password = loginPasswordController.text.trim();
    update();
    await repository.login(authPayload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          final loginData = response?.data;
          setAuthData(loginData);
          update();
          
          context.loaderOverlay.hide();
          secureRoutes(loginData!);
          break;
        case Result.onFailed:
          loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message ?? "error");
          break;
        case Result.onException:
          loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', "error");
          break;
      }
    });
  }

  Future<void> register(BuildContext context) async {
    loading = true;
    var authPayload = AuthPayload();
    authPayload.countryCode = dialCode;
    authPayload.name = registerNameController.text.trim();
    authPayload.email = registerEmailController.text.trim();
    authPayload.phoneNumber = registerPhoneController.text.trim();
    authPayload.password = registerPasswordController.text.trim();
    authPayload.role = selecedRole.trim();
    update();
    await repository.register(authPayload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          initRegister();
          Get.snackbar("success", response?.message ?? "user Registered");
          update();
          context.loaderOverlay.hide();
          // Get.offAndToNamed(RoutesHelper.getLogin());
          print("success :: 1");
          break;
        case Result.onFailed:
          loading = false;
          update();
          context.loaderOverlay.hide();

          Get.snackbar('Error', message?.tr ?? "error");
          print("Error :: 2");
          break;
        case Result.onException:
          loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message?.tr ?? "error");
          print("Error :: 3");
          break;
      }
    });
  }

  Future<void> sendOtp({String? email, required BuildContext context}) async {
    loading = true;
    var authPayload = AuthPayload();
    authPayload.email = email ?? forgotEmailController.text.trim();
    update();
    await repository.sendOtp(authPayload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          authData = response?.data;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Success', response?.message ?? "");

          Get.toNamed(RoutesHelper.getVerifyOtp(
              userId: authData?.id ?? "", email: authData?.email ?? ""));

          break;
        case Result.onFailed:
          loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
        case Result.onException:
          loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
      }
    });
  }

  Future<void> verifyOtp(
      {required String userId,
      required String otp,
      required BuildContext context}) async {
    loading = true;
    var authPayload = AuthPayload();
    authPayload.userId = userId;
    authPayload.otp = otp;
    update();
    await repository.verifyOtp(authPayload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          update();
          context.loaderOverlay.hide();
          Get.toNamed(RoutesHelper.getResetPassword(userId: "$userId"));
          break;
        case Result.onFailed:
          loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
        case Result.onException:
          loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
      }
    });
  }

  Future<void> resetPassword(
      {required String userId, required BuildContext context}) async {
    loading = true;
    var authPayload = AuthPayload();
    authPayload.userId = userId;
    authPayload.password = resetPasswordController.text.trim();
    update();
    await repository.resetPassword(authPayload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          context.loaderOverlay.hide();
          update();
          Get.offAllNamed(RoutesHelper.getLogin());
          break;
        case Result.onFailed:
          loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
        case Result.onException:
          loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
      }
    });
  }
}
