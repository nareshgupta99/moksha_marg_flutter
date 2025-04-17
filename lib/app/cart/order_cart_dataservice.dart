import 'package:get/get.dart';
import 'package:moksha_marg/app/cart/order_cart_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/network/response/order_food_data.dart';
import 'package:moksha_marg/util/custom_enum.dart';

extension OrderCartDataservice on OrderCartController {
  Future<void> createFoodOrder({required double amount}) async {
    OrderPayload payload = OrderPayload();
    payload.amount = amount;
    print(amount);
    loading = true;
    await repository.createOrderForFood(payload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          OrderFoodData? data = response?.data;
          foodOrderData = data;
          print("food cart data :: $data");
          update();
          initiatePayment();
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

  Future<void> paymentVerificationFood(
      {required PaymentVerificationPayload payload}) async {
    loading = true;
    await repository.paymentVerificationForFood(payload,
        (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
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
