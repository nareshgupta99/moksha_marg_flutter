import 'package:get/get.dart';
import 'package:moksha_marg/admin/temple_controller.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/util/custom_enum.dart';

extension TempleDataservice on TempleController {
  Future<void> addTemple() async {
    // loading = true;
    TemplePayload payload = TemplePayload();
    payload.city = cityController.text.trim();
    payload.liveLink = linkController.text.trim();
    payload.name = nameController.text.trim();
    payload.streetAddress = streetAddressController.text.trim();
    payload.image = Get.find<FilePickerController>().multipartFiles;

    update();
    await repository.addTemple(payload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          // loading = false;
          final data = response?.data;
          templeData = data;
          Get.find<TempleController>().init();
          update();
          Get.snackbar("success", response?.message ?? "");
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

  Future<void> getAllTemples() async {
    // loading = true;

    await repository.getAllTemple((result, response, message) {
      switch (result) {
        case Result.onSuccess:
          // loading = false;
          final data = response?.dataList;
          temples = response?.dataList ?? [];
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

  Future<void> getTempleById({required String id}) async {
    // loading = true;

    await repository.getTempelById(id, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          // loading = false;
          final data = response?.data;
          templeData = data!;
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

  Future<void> deleteTempleById({required String id}) async {
    // loading = true;

    await repository.deleteTempelById(id, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          // loading = false;
          final data = response?.data;
          templeData = data!;
          update();
          getAllTemple();
          break;
        case Result.onFailed:
          // loading = false;
          update();
          // Get.snackbar('Error', message?.tr ?? "error");
          break;
        case Result.onException:
          // loading = false;
          update();
          // Get.snackbar('Error', message?.tr ?? "error");
          break;
      }
    });
  }
}
