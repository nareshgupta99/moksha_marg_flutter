import 'package:get/get.dart';
import 'package:moksha_marg/app/cart/food_cart_controller.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/network/response/food_cart_data.dart';
import 'package:moksha_marg/util/custom_enum.dart';

extension FoodCartDataservice on FoodCartController {
  Future<void> getAllFromCart() async {
    loading = true;
    await repository.getAllFromCart((result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          List<FoodCartData> data = response?.dataList ?? [];
          print("food cart data :: $data");
          cartItems = data;

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

  Future<void> addToFoodCart(
      {required int dishId, required int quantity}) async {
    loading = true;
    FoodCartPayload payload = new FoodCartPayload();
    payload.dishId = dishId;
    payload.quantity = quantity;
    await repository.addToFoodCart(payload,(result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          getAllFromCart();
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

  Future<void> removeOneFromCart(
      {required int cartItemId}) async {
    loading = true;
    await repository.removeQuantityFromCart(cartItemId,(result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          getAllFromCart();
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
