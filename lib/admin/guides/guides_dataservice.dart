import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:moksha_marg/admin/guides/guides_controller.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/util/custom_enum.dart';

extension RestaurantDataservice on GuidesController {
  Future<void> createGuide({required BuildContext context}) async {
    loading = true;
    RestaurantPayload restaurantPayload = RestaurantPayload();
    restaurantPayload.foodType = foodTypes;
    restaurantPayload.image = Get.find<FilePickerController>().multipartFiles;

    update();
    await repository.registerGuide(restaurantPayload,
        (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          final data = response?.data;
          restaurantData = data!;
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
          restaurants = response?.dataList ?? [];
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
          restaurantData = data!;
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
}
