import 'package:moksha_marg/network/network_endpoint.dart';
import 'package:moksha_marg/network/network_exception.dart';
import 'package:moksha_marg/network/network_manager.dart';
import 'package:moksha_marg/network/network_response.dart';
import 'package:moksha_marg/network/request/network_payload.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/network/response/login_data.dart';
import 'package:moksha_marg/util/custom_enum.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController implements GetxService {
  final NetworkManager network;
  AuthenticationRepository({required this.network});

  Future<void> login(AuthPayload payload, Function(Result result, NetworkResponse<LoginData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.login, method: HTTPMethod.post, payload: NetworkPayload.loginPaylod(payload: payload));
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => LoginData.fromJson(json));
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

  Future<void> register(AuthPayload payload, Function(Result result, NetworkResponse? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.register, method: HTTPMethod.post, payload: NetworkPayload.registerPaylod(payload: payload));
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) {});
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

  Future<void> sendOtp(AuthPayload payload, Function(Result result, NetworkResponse<LoginData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.sendOtp, method: HTTPMethod.post, payload: NetworkPayload.sendOtpPaylod(payload: payload));
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => LoginData.fromJson(json));
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

  Future<void> verifyOtp(AuthPayload payload, Function(Result result, NetworkResponse<LoginData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.verifyOtp, method: HTTPMethod.post, payload: NetworkPayload.verifyOtpPaylod(payload: payload));
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => LoginData.fromJson(json));
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


  Future<void> resetPassword(AuthPayload payload, Function(Result result, NetworkResponse<LoginData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.forgetPassword, method: HTTPMethod.post, payload: NetworkPayload.forgetPasswordPaylod(payload: payload));
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => LoginData.fromJson(json));
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