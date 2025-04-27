import 'dart:convert';

import 'package:moksha_marg/network/network_endpoint.dart';
import 'package:moksha_marg/network/network_exception.dart';
import 'package:moksha_marg/network/network_manager.dart';
import 'package:moksha_marg/network/network_response.dart';
import 'package:moksha_marg/network/request/network_payload.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/network/response/restaurant_data.dart';
import 'package:moksha_marg/util/custom_enum.dart';
import 'package:get/get.dart';

class AdminRepository extends GetxController implements GetxService {
  final NetworkManager network;
  AdminRepository({required this.network});

  Future<void> addBanner(
      BannerPayload payload,
      Function(Result result, NetworkResponse<RestaurantData>? response,
              String? message)
          completion) async {
    try {
      final networkResponse = await network.loadHTTP(
          endpoint: Endpoints.addRestaurant,
          method: HTTPMethod.multipartPOST,
          multipartFiles: payload.image,
          multipartPayload: {});
      try {
        final response = NetworkResponse.fromJson(
            networkResponse, (json) => RestaurantData.fromJson(json));
        completion(
            (response.status == true) ? Result.onSuccess : Result.onFailed,
            response,
            response.message);
      } catch (e) {
        print(e);
        // throw FetchNetworkException(exceptionRawValues[Exceptions.handShakeError]);
      }
    } catch (exception) {
      completion(Result.onException, null, exception.toString());
      rethrow;
    }
  }

  Future<void> getALlBanner(
      Function(Result result, NetworkResponse0<RestaurantData>? response,
              String? message)
          completion) async {
    try {
      final networkResponse = await network.loadHTTP(
          endpoint: Endpoints.getAllRestaurant, method: HTTPMethod.get);
      try {
        final response = NetworkResponse0.fromJson(
            networkResponse, (json) => RestaurantData.fromJson(json));
        completion(
            (response.status == true) ? Result.onSuccess : Result.onFailed,
            response,
            response.message);
      } catch (e) {
        print("Exception :: ${e.toString()}");
        throw FetchNetworkException(
            exceptionRawValues[Exceptions.handShakeError]);
      }
    } catch (exception) {
      completion(Result.onException, null, exception.toString());
      rethrow;
    }
  }

  Future<void> deleteBannerById(
      String id,
      Function(Result result, NetworkResponse<RestaurantData>? response,
              String? message)
          completion) async {
    try {
      final networkResponse = await network.loadHTTP(
          endpoint: Endpoints.getRestaurantById,
          method: HTTPMethod.get,
          slashedQuery: "/$id");
      try {
        final response = NetworkResponse.fromJson(
            networkResponse, (json) => RestaurantData.fromJson(json));
        completion(
            (response.status == true) ? Result.onSuccess : Result.onFailed,
            response,
            response.message);
      } catch (e) {
        print("Exception :: ${e.toString()}");
        throw FetchNetworkException(
            exceptionRawValues[Exceptions.handShakeError]);
      }
    } catch (exception) {
      completion(Result.onException, null, exception.toString());
      rethrow;
    }
  }
}
