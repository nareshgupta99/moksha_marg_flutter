import 'dart:convert';

import 'package:moksha_marg/network/network_endpoint.dart';
import 'package:moksha_marg/network/network_exception.dart';
import 'package:moksha_marg/network/network_manager.dart';
import 'package:moksha_marg/network/network_response.dart';
import 'package:moksha_marg/network/request/network_payload.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/network/response/temple_data.dart';
import 'package:moksha_marg/util/custom_enum.dart';
import 'package:get/get.dart';

class TempleRepository extends GetxController implements GetxService {
  final NetworkManager network;
  TempleRepository({required this.network});

  Future<void> addTemple(TemplePayload payload, Function(Result result, NetworkResponse<TempleData>? response, String? message) completion) async {
    try {
      
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.addTemple, method: HTTPMethod.multipartPOST, payload: NetworkPayload.templePayload(payload: payload),multipartFiles: payload.image,multipartPayload: {"temple": jsonEncode(NetworkPayload.templePayload(payload: payload))}  );
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => TempleData.fromJson(json));
        completion((response.status == true) ? Result.onSuccess : Result.onFailed, response, response.message);
      } catch (e) {
        throw FetchNetworkException(exceptionRawValues[Exceptions.handShakeError]);
      }
    } catch (exception) {
      completion(Result.onException, null, exception.toString());
      rethrow;
    }
  }
  

  
     Future<void> getAllTemple( Function(Result result, NetworkResponse0<TempleData>? response, String? message) completion) async {
    try {
      
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.getAllTemple, method: HTTPMethod.get);
      try {
        final response = NetworkResponse0.fromJson(networkResponse, (json) => TempleData.fromJson(json));
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

  
     Future<void> getTempelById(String id, Function(Result result, NetworkResponse<TempleData>? response, String? message) completion) async {
    try {
      
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.getRestaurantById, method: HTTPMethod.get,slashedQuery:"/$id" );
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => TempleData.fromJson(json));
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



Future<void> deleteTempelById(String id, Function(Result result, NetworkResponse<TempleData>? response, String? message) completion) async {
    try {
      
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.deleteTempleById, method: HTTPMethod.delete,slashedQuery:"/$id" );
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => TempleData.fromJson(json));
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
