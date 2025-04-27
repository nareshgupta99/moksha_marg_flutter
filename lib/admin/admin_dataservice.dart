import 'package:get/get.dart';
import 'package:moksha_marg/admin/admin_controller.dart';
import 'package:moksha_marg/admin/restaurent/restarant_controller.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/util/custom_enum.dart';

extension AdminDataservice on AdminController {
  Future<void> addBannerImage() async {
    loading = true;
    BannerPayload payload = new BannerPayload();
    payload.image = Get.find<FilePickerController>().multipartFiles;

    update();
    await repository.addBanner(payload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          // loading = false;
          final data = response?.data;
          update();
          Get.offAllNamed(RoutesHelper.getAddDish());
          break;
        case Result.onFailed:
          // loading = false;
          update();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
        case Result.onException:
          // loading = false;
          update();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
      }
    });
  }

  Future<void> getAllRestaurantData() async {
    // loading = true;

    await repository.getALlBanner((result, response, message) {
      switch (result) {
        case Result.onSuccess:
          // loading = false;
          final data = response?.dataList;
          update();
          // Get.offAllNamed(RoutesHelper.getHome());
          break;
        case Result.onFailed:
          // loading = false;
          update();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
        case Result.onException:
          // loading = false;
          update();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
      }
    });
  }

  Future<void> deleteBanner({required String id}) async {
    // loading = true;

    await repository.deleteBannerById(id, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          // loading = false;
          final data = response?.data;
          update();
          // Get.offAllNamed(RoutesHelper.getHome());
          break;
        case Result.onFailed:
          // loading = false;
          update();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
        case Result.onException:
          // loading = false;
          update();
          Get.snackbar('Error', message?.tr ?? "error");
          break;
      }
    });
  }
}
