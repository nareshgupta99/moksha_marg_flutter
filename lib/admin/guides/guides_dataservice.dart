import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:moksha_marg/admin/guides/guides_controller.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/util/custom_enum.dart';

extension GuidesDataservice on GuidesController {
  Future<void> createGuide({required BuildContext context}) async {
    loading = true;
    GuidePayload guidePayload = GuidePayload();
    guidePayload.contactNumber = contactNumberController.text.trim();
    guidePayload.price = double.parse(priceController.text.trim());
    guidePayload.languages = selectedLanguage;
    guidePayload.image = Get.find<FilePickerController>().multipartFiles;

    update();
    await repository.registerGuide(guidePayload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          final data = response?.data;
          guideData = data!;
          context.loaderOverlay.hide();
          update();
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

  Future<void> getAllGuide() async {
    loading = true;

    await repository.getAllGuide((result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          final data = response?.dataList;
          
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

  Future<void> getGuideById(
      {required String id, required BuildContext context}) async {
    loading = true;

    await repository.getGuideById(id, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          final data = response?.data;
          // restaurantData = data!;
          update();
          Get.offAllNamed(RoutesHelper.getHome());
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

  Future<void> getAllLanguage() async {
    loading = true;

    await repository.getAllLanguage((result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          final data = response?.dataList;
          languagesData = data!;
          languagesData.forEach((ele) {
            languages.add(ele.languageName ?? "");
          });
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
