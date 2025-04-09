import 'package:moksha_marg/network/request/network_request_body.dart';

class NetworkPayload {
  static Map<String, dynamic>? loginPaylod({required AuthPayload payload}) {
    return {
      "email": payload.email,
      "password": payload.password,
    };
  }

  static Map<String, dynamic>? registerPaylod({required AuthPayload payload}) {
    return {
      "name": payload.name,
      "email": payload.email,
      "password": payload.password,
      "countryCode": payload.countryCode,
      "phoneNumber": payload.phoneNumber,
      "role":payload.role
    };
  }

  static Map<String, dynamic>? sendOtpPaylod({required AuthPayload payload}) {
    return {
      "email": payload.email,
    };
  }

  static Map<String, dynamic>? verifyOtpPaylod({required AuthPayload payload}) {
    return {
      "userId": payload.userId,
      "otp": payload.otp,
    };
  }

  static Map<String, dynamic>? forgetPasswordPaylod(
      {required AuthPayload payload}) {
    return {
      "userId": payload.userId,
      "password": payload.password,
    };
  }

  static Map<String, dynamic>? restaurantPayload({required RestaurantPayload payload}) {
  return {
    "name": payload.name,
    "address": payload.addres,
    "openingTime": payload.openingTime,
    "closingTime": payload.closingTime,
    "startingPrice": payload.startingPrice,
    "latitude": payload.latitude,
    "longitude": payload.longitude,
  };
}

}
