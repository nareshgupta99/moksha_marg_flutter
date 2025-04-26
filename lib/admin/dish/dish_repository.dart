import 'dart:convert';

import 'package:moksha_marg/network/network_endpoint.dart';
import 'package:moksha_marg/network/network_exception.dart';
import 'package:moksha_marg/network/network_manager.dart';
import 'package:moksha_marg/network/network_response.dart';
import 'package:moksha_marg/network/request/network_payload.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/network/response/add_dish.dart';
import 'package:moksha_marg/util/custom_enum.dart';
import 'package:get/get.dart';

class DishRepository extends GetxController implements GetxService {
  final NetworkManager network;
  DishRepository({required this.network});

  Future<void> addDish(DishPayload payload, Function(Result result, NetworkResponse<DishData>? response, String? message) completion) async {
    try {
      
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.addDish, method: HTTPMethod.multipartPOST, payload: NetworkPayload.dishPayload(payload: payload),multipartFiles: payload.image,multipartPayload: {"dish": jsonEncode(NetworkPayload.dishPayload(payload: payload))}  );
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => DishData.fromJson(json));
        completion((response.status == true) ? Result.onSuccess : Result.onFailed, response, response.message);
      } catch (e) {
        throw FetchNetworkException(exceptionRawValues[Exceptions.handShakeError]);
      }
    } catch (exception) {
      print(exception);
      completion(Result.onException, null, exception.toString());
      rethrow;
    }
  }
  

  
     Future<void> getAllDishByRestaurant(String id, Function(Result result, NetworkResponse0<DishData>? response, String? message) completion) async {
    try {
      
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.getAllDishByRestaurant, method: HTTPMethod.get,slashedQuery:"/$id");
      try {
        final response = NetworkResponse0.fromJson(networkResponse, (json) => DishData.fromJson(json));
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

  
    Future<void> getDishById(String id, Function(Result result, NetworkResponse<DishData>? response, String? message) completion) async {
    try {
      
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.getRestaurantById, method: HTTPMethod.get,slashedQuery:"/$id" );
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => DishData.fromJson(json));
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

   Future<void> deleteDishById(String id, Function(Result result, NetworkResponse<DishData>? response, String? message) completion) async {
    try {
      
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.deleteDish, method: HTTPMethod.delete,slashedQuery:"/$id" );
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => DishData.fromJson(json));
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
