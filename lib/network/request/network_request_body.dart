import 'package:moksha_marg/network/network_resources.dart';

class AuthPayload {
  int? userId;
  String? name;
  String? email;
  String? password;
  String? countryCode;
  String? phoneNumber;
  String? otp;
  String? role;
}

class RestaurantPayload {
  String? name;
  String? address;
  String? openingTime;
  String? closingTime;
  String? startingPrice;
  List<MultipartFiles>? image;
  String? latitude;
  String? longitude;
  List<String> foodType = [];
}

class DishPayload {
  String? dishName;
  List<MultipartFiles>? image;
  String? price;
  String? foodTypes;
  String? description;
  String? shortDescription;
}

class FoodCartPayload {
  int? dishId;
  int? quantity;
}

class OrderPayload {
  double? amount;
  String? method;
}

class PaymentVerificationPayload {
  String? paymentId;
  String? razorpayOrderId;
  String? signature;
}
