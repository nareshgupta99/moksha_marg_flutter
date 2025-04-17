import 'package:get/get.dart';
import 'package:moksha_marg/app/authentication/authentication_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/util/custom_enum.dart';

extension AuthenticationDataService on AuthenticationController {
  Future<void> login() async {
    loading = true;
    var authPayload = AuthPayload();
    authPayload.email = loginEmailController.text.trim();
    authPayload.password = loginPasswordController.text.trim();
    update();
    await repository.login(authPayload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          final loginData = response?.data;
          setAuthData(loginData);
          update();
          secureRoutes(loginData!);
          // Get.offAllNamed(RoutesHelper.getHome());
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

  Future<void> register() async {
    loading = true;
    var authPayload = AuthPayload();
    authPayload.countryCode = dialCode;
    authPayload.name = registerNameController.text.trim();
    authPayload.email = registerEmailController.text.trim();
    authPayload.phoneNumber = registerPhoneController.text.trim();
    authPayload.password = registerPasswordController.text.trim();
    authPayload.role = selecedRole.trim();
    update();
    await repository.register(authPayload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          update();
          Get.offAndToNamed(RoutesHelper.getLogin());
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

  Future<void> sendOtp({String? email}) async {
    loading = true;
    var authPayload = AuthPayload();
    authPayload.email = email ?? forgotEmailController.text.trim();
    update();
    await repository.sendOtp(authPayload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          authData = response?.data;
          update();
            Get.snackbar('Success', response?.message ?? "");
        
            Get.toNamed(RoutesHelper.getVerifyOtp(
                userId: authData?.id ?? 0, email:authData?.email ??"" ));
          
          
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

  Future<void> verifyOtp({required int  userId, required String otp}) async {
    loading = true;
    var authPayload = AuthPayload();
    authPayload.userId = userId;
    authPayload.otp = otp;
    update();
    await repository.verifyOtp(authPayload, (result, response, message) {
      switch (result) {
        case Result.onSuccess:
          loading = false;
          update();
          // Get.toNamed(RoutesHelper.getResetPassword(id: userId));
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

  // Future<void> resetPassword({required String userId}) async {
  //   loading = true;
  //   var authPayload = AuthPayload();
  //   authPayload.userId = userId;
  //   authPayload.password = resetPasswordController.text.trim();
  //   update();
  //   await repository.resetPassword(authPayload, (result, response, message) {
  //     switch (result) {
  //       case Result.onSuccess:
  //         loading = false;
  //         update();
  //         Get.offAllNamed(RoutesHelper.getLogin());
  //         break;
  //       case Result.onFailed:
  //         loading = false;
  //         update();
  //         Get.snackbar('Error', message?.tr ?? "error");
  //         break;
  //       case Result.onException:
  //         loading = false;
  //         update();
  //         Get.snackbar('Error', message?.tr ?? "error");
  //         break;
  //     }
  //   });
  // }
}
