import 'dart:convert';

import 'package:moksha_marg/network/network_endpoint.dart';
import 'package:moksha_marg/network/network_exception.dart';
import 'package:moksha_marg/network/network_manager.dart';
import 'package:moksha_marg/network/network_response.dart';
import 'package:moksha_marg/network/request/network_payload.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/network/response/guide_data.dart';
import 'package:moksha_marg/network/response/language_data.dart';
import 'package:moksha_marg/network/response/login_data.dart';
import 'package:moksha_marg/network/response/restaurant_data.dart';
import 'package:moksha_marg/util/custom_enum.dart';
import 'package:get/get.dart';

class GuideRepository extends GetxController implements GetxService {
  final NetworkManager network;
  GuideRepository({required this.network});

  Future<void> registerGuide( GuidePayload payload,Function(Result result, NetworkResponse<GuideData>? response, String? message)completion) async {
    try {
      final networkResponse = await network.loadHTTP( endpoint: Endpoints.addGuide, method: HTTPMethod.multipartPOST,payload: NetworkPayload.guidePayload(payload: payload),multipartFiles: payload.image, multipartPayload: {"guide": jsonEncode(NetworkPayload.guidePayload(payload: payload))  });
      try {
        final response = NetworkResponse.fromJson( networkResponse, (json) => GuideData.fromJson(json));
        completion( (response.status == true) ? Result.onSuccess : Result.onFailed,response, response.message);
      } catch (e) {
        print(e);
        throw FetchNetworkException( exceptionRawValues[Exceptions.handShakeError]);
      }
    } catch (exception) {
      completion(Result.onException, null, exception.toString());
      rethrow;
    }
  }

  Future<void> getAllGuide(  Function(Result result, NetworkResponse0<GuideData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.getAllGuide, method: HTTPMethod.get);
      try {
        final response = NetworkResponse0.fromJson(networkResponse, (json) => GuideData.fromJson(json));
        completion(  (response.status == true) ? Result.onSuccess : Result.onFailed, response, response.message);
      } catch (e) {
        print("Exception :: ${e.toString()}");
        throw FetchNetworkException( exceptionRawValues[Exceptions.handShakeError]);
      }
    } catch (exception) {
      completion(Result.onException, null, exception.toString());
      rethrow;
    }
  }

  Future<void> getGuideById( String id,Function(Result result, NetworkResponse<GuideData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.getGuideById, method: HTTPMethod.get, slashedQuery: "/$id");
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => GuideData.fromJson(json));
        completion((response.status == true) ? Result.onSuccess : Result.onFailed,response,response.message);
      } catch (e) {
        print("Exception :: ${e.toString()}");
        throw FetchNetworkException( exceptionRawValues[Exceptions.handShakeError]);
      }
    } catch (exception) {
      completion(Result.onException, null, exception.toString());
      rethrow;
    }
  }

  Future<void> getAllLanguage(Function(Result result, NetworkResponse0<LanguageData>? response,String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP( endpoint: Endpoints.getAllLanguage, method: HTTPMethod.get);
      try {
        final response = NetworkResponse0.fromJson( networkResponse, (json) => LanguageData.fromJson(json));
        completion((response.status == true) ? Result.onSuccess : Result.onFailed,response, response.message);
      } catch (e) {
        print("Exception :: ${e}");
        throw FetchNetworkException(exceptionRawValues[Exceptions.handShakeError]);
      }
    } catch (exception) {
      completion(Result.onException, null, exception.toString());
      rethrow;
    }
  }
}
