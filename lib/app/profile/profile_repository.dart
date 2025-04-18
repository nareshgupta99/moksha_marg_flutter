import 'package:moksha_marg/network/network_endpoint.dart';
import 'package:moksha_marg/network/network_exception.dart';
import 'package:moksha_marg/network/network_manager.dart';
import 'package:moksha_marg/network/network_response.dart';
import 'package:moksha_marg/network/request/network_payload.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/network/response/auth_data.dart';
import 'package:moksha_marg/network/response/login_data.dart';
import 'package:moksha_marg/util/custom_enum.dart';
import 'package:get/get.dart';

class ProfileRepository extends GetxController implements GetxService {
  final NetworkManager network;
  ProfileRepository({required this.network});

  Future<void> updatePassword(AuthPayload payload, Function(Result result, NetworkResponse<LoginData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.updatePassword, method: HTTPMethod.post, payload: NetworkPayload.updatePasswordPayload(payload: payload));
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

  Future<void> updateImage(AuthPayload payload, Function(Result result, NetworkResponse? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.updateProfilePictuce, method: HTTPMethod.post, multipartFiles: payload.image);
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

  Future<void> updateProfile(AuthPayload payload, Function(Result result, NetworkResponse<AuthData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.sendOtp, method: HTTPMethod.post, payload: NetworkPayload.updateProfilePayload(payload: payload));
      try {
        final response = NetworkResponse.fromJson(networkResponse, (json) => AuthData.fromJson(json));
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

  


  Future<void> getProfile( Function(Result result, NetworkResponse<LoginData>? response, String? message) completion) async {
    try {
      final networkResponse = await network.loadHTTP(endpoint: Endpoints.getUserProfile, method: HTTPMethod.get);
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