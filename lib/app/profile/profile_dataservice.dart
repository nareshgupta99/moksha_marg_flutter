import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:moksha_marg/app/profile/profile_controller.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/util/custom_enum.dart';

extension ProfileDataservice on ProfileController {
  Future<void> updateUserPassword({required BuildContext context}) async {
    // loading = true;
    var authPayload = AuthPayload();
    authPayload.oldPassword = oldPasswordController.text.trim();
    authPayload.password = newPasswordController.text.trim();
    update();
    await repository.updatePassword(authPayload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          // loading = false;
          final loginData = response?.data;
          context.loaderOverlay.hide();
          Get.back();
          update();
          break;
        case Result.onFailed:
          // loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
        case Result.onException:
          // loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
      }
    });
  }

  Future<void> updateUserImage({required BuildContext context}) async {
    // loading = true;
    var authPayload = AuthPayload();
    authPayload.image = Get.find<FilePickerController>().multipartFiles;
    update();
    await repository.updateImage(authPayload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          Get.snackbar("Success", response?.message ?? "");
          update();
          context.loaderOverlay.hide();
          getUserProfile();
          break;
        case Result.onFailed:
          // loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
        case Result.onException:
          // loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
      }
    });
  }

  Future<void> updateProfile(
      {String? email, required BuildContext context}) async {
    // loading = true;
    var authPayload = AuthPayload();
    authPayload.name = "";
    update();
    await repository.updateProfile(authPayload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          // loading = false;
          // authData = response?.data;
          context.loaderOverlay.hide();
          update();
          break;
        case Result.onFailed:
          // loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
        case Result.onException:
          // loading = false;
          update();
          context.loaderOverlay.hide();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
      }
    });
  }

  Future<void> getUserProfile({String? email}) async {
    loading = true;
    update();
    await repository.getProfile((result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          user = response?.data;
          update();
          break;
        case Result.onFailed:
          loading = false;
          update();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
        case Result.onException:
          loading = false;
          update();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
      }
    });
  }
}
