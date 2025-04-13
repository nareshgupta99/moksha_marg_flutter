import 'package:get/get.dart';
import 'package:moksha_marg/admin/dish/dish_controller.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/util/custom_enum.dart';

extension DishDataservice on DishController {
  Future<void> createDish() async {
    // loading = true;
    DishPayload dishPayload = DishPayload();
    dishPayload.dishName = addDishNameController.text.trim();
    dishPayload.description = descriptionController.text.trim();
    dishPayload.shortDescription = shortDescriptionController.text.trim();
    dishPayload.price=priceControllerController.text.trim();
    dishPayload.foodTypes = selecedFoodTypes;
    dishPayload.image = Get.find<FilePickerController>().multipartFiles;

    update();
    await repository.addDish(dishPayload,
        (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          // loading = false;
          final data = response?.data;
          //  = data!;
          update();
          Get.offAllNamed(RoutesHelper.getHome());
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

  Future<void> getAllRestaurantData({required int id}) async {
    // loading = true;

    await repository.getAllDishByRestaurant(id,(result, response, message) {
      switch (result) {
        case Result.onSuccess:
          // loading = false;
          final data = response?.dataList;
          dishList = response?.dataList ?? [];
          print("network 0 = ${response?.dataList?.length}");
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

  Future<void> getDish({required int id}) async {
    // loading = true;

    await repository.getDishById(id, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          // loading = false;
          final data = response?.data;
          dish = data!;
          print(data?.dishName);
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
