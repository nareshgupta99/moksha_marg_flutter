import 'package:moksha_marg/network/network_endpoint.dart';
import 'package:moksha_marg/network/network_exception.dart';
import 'package:moksha_marg/network/network_manager.dart';
import 'package:moksha_marg/network/network_response.dart';
import 'package:moksha_marg/network/request/network_payload.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/network/response/food_cart_data.dart';
import 'package:moksha_marg/network/response/order_food_data.dart';
import 'package:moksha_marg/util/custom_enum.dart';
import 'package:get/get.dart';

class OrderCartRepository extends GetxController implements GetxService {
  final NetworkManager network;
  OrderCartRepository({required this.network});

  Future<void> createOrderForFood( OrderPayload payload,Function(Result result, NetworkResponse<OrderFoodData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.createFoodOrder, method: HTTPMethod.post, payload: NetworkPayload.orderPayload(payload: payload));
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => OrderFoodData.fromJson(json));
        completion((response.status == true) ? Result.onSuccess : Result.onFailed, response, response.message);
      } catch (e) {
        print("Exception :: ${e.toString()}");
        throw FetchNetworkException(exceptionRawValues[Exceptions.handShakeError]);
      }
    } catch (exception) {
      completion(Result.onException, null, exception.toString());
      rethrow;
    }
  }

  Future<void> paymentVerificationForFood(PaymentVerificationPayload payload, Function(Result result, NetworkResponse<OrderFoodData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.paymentVerificationForFood, method: HTTPMethod.post, payload: NetworkPayload.paymentVerificationPayload(payload: payload));
      try {
        final response = NetworkResponse.fromJson(networkResponse,  (json) => OrderFoodData.fromJson(json));
        completion((response.status == true) ? Result.onSuccess : Result.onFailed, response, response.message);
      } catch (e) {
        print("Exception :: ${e.toString()}");
        throw FetchNetworkException(exceptionRawValues[Exceptions.handShakeError]);
      }
    } catch (exception) {
      completion(Result.onException, null, exception.toString());
      rethrow;
    }
  }

}