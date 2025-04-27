import 'package:get/get.dart';
import 'package:moksha_marg/admin/restaurent/restarant_controller.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/util/custom_enum.dart';

extension RestaurantDataservice on RestarantController {
  Future<void> registerRestaurant() async {
    // loading = true;
    RestaurantPayload restaurantPayload = RestaurantPayload();
    restaurantPayload.address = addressController.text.trim();
    restaurantPayload.name = restaurantNameController.text.trim();
    restaurantPayload.closingTime = clossingTimeController.text.trim();
    restaurantPayload.openingTime = openingTimeController.text.trim();
    restaurantPayload.startingPrice = startingPriceController.text.trim();
    restaurantPayload.startingPrice = startingPriceController.text.trim();
    restaurantPayload.foodType = foodTypes;
    restaurantPayload.image = Get.find<FilePickerController>().multipartFiles;

    update();
    await repository.registerRestaurant(restaurantPayload,
        (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          final data = response?.data;
          restaurantData = data!;
          update();
          Get.offAllNamed(RoutesHelper.getAddDish());
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

  Future<void> getAllRestaurantData() async {
    loading = true;

    await repository.getAllRestaurant((result, response, message) {
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

  Future<void> getRestaurantDataById({required String id}) async {
    loading = true;

    await repository.getRestaurantDataById(id, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          final data = response?.data;
          restaurantData = data!;
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
