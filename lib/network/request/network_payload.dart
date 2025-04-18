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
      "role": payload.role
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

  static Map<String, dynamic>? restaurantPayload(
      {required RestaurantPayload payload}) {
    return {
      "name": payload.name,
      "address": payload.address,
      "openingTime": payload.openingTime,
      "closeTime": payload.closingTime,
      "startingPrice": payload.startingPrice,
      "latitude": payload.latitude,
      "longitude": payload.longitude,
      "foodTypes": payload.foodType,
      "open": true
    };
  }

  static Map<String, dynamic>? dishPayload({required DishPayload payload}) {
    return {
      "dishName": payload.dishName,
      "price": payload.price,
      "foodTypes": payload.foodTypes,
      "shortDescription": payload.shortDescription,
      "description": payload.description,
    };
  }

  static Map<String, dynamic>? foodCartPayload(
      {required FoodCartPayload payload}) {
    return {"dishId": payload.dishId, "quantity": payload.quantity};
  }

  static Map<String, dynamic>? orderPayload({required OrderPayload payload}) {
    return {"amount": payload.amount, "method": payload.method};
  }

  static Map<String, dynamic>? paymentVerificationPayload(
      {required PaymentVerificationPayload payload}) {
    return {
      "orderId": payload.razorpayOrderId,
      "signature": payload.signature,
      "paymentId": payload.paymentId
    };
  }

  static Map<String, dynamic>? templePayload({required TemplePayload payload}) {
    return {
      "name": payload.name,
      "streetAddress": payload.streetAddress,
      "city": payload.city,
      "liveLink": payload.liveLink
    };
  }

  static Map<String, dynamic>? updatePasswordPayload({required AuthPayload payload}) {
    return {
      "oldPassword": payload.oldPassword,
      "password": payload.password,
    };
  }

  static Map<String, dynamic>? updateProfilePayload({required AuthPayload payload}) {
    return {
      "name": payload.name,
    };
  }

}
