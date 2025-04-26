import 'package:moksha_marg/network/network_endpoint.dart';
import 'package:moksha_marg/network/network_exception.dart';
import 'package:moksha_marg/network/network_manager.dart';
import 'package:moksha_marg/network/network_response.dart';
import 'package:moksha_marg/network/request/network_payload.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/network/response/food_cart_data.dart';
import 'package:moksha_marg/network/response/login_data.dart';
import 'package:moksha_marg/util/custom_enum.dart';
import 'package:get/get.dart';

class FoodCartRepository extends GetxController implements GetxService {
  final NetworkManager network;
  FoodCartRepository({required this.network});

  Future<void> getAllFromCart( Function(Result result, NetworkResponse0<FoodCartData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.getAllFromFoodCart, method: HTTPMethod.get);
      try {
        final response = NetworkResponse0.fromJson(networkResponse, (json) => FoodCartData.fromJson(json));
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

  Future<void> addToFoodCart(FoodCartPayload payload, Function(Result result, NetworkResponse? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.addItemToFoodCart, method: HTTPMethod.post, payload: NetworkPayload.foodCartPayload(payload: payload));
      try {
        final response = NetworkResponse.fromJson(networkResponse,  (json) => FoodCartData.fromJson(json));
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

  Future<void> removeQuantityFromCart( String cartItemId,Function(Result result, NetworkResponse<FoodCartData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.removeOneQuantityFromFoodCart, method: HTTPMethod.delete,slashedQuery: "/$cartItemId");
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => FoodCartData.fromJson(json));
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

  Future<void> removeAllFromCart( Function(Result result, NetworkResponse0<FoodCartData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.removeAllFromFoodCart, method: HTTPMethod.delete);
      try {
        final response = NetworkResponse0.fromJson(networkResponse, (json) => FoodCartData.fromJson(json));
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


  Future<void> removeItemFromCartById(String cartItemId, Function(Result result, NetworkResponse<FoodCartData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.forgetPassword, method: HTTPMethod.delete,slashedQuery: "/$cartItemId");
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => FoodCartData.fromJson(json));
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