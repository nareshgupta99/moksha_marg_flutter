import 'package:moksha_marg/network/network_resources.dart';

class AuthPayload {
  String? userId;
  String? name;
  String? email;
  String? password;
  String? countryCode;
  String? phoneNumber;
  String? otp;
  String? role;
  String? oldPassword;
  List<MultipartFiles>? image;
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
  String? dishId;
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

class TemplePayload {
  String? id;
  String? name;
  String? streetAddress;
  String? city;
  String? liveLink;
  String? longitude;
  String? latitude;
  List<MultipartFiles>? image;

}

class BannerPayload {
  List<MultipartFiles>? image;
}

class GuidePayload {
  String? contactNumber;
  double? price;
  List<MultipartFiles>? image;
  List<String>? languages;
}
