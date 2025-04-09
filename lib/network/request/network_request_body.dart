import 'package:file_picker/file_picker.dart';

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


class RestaurantPayload{
  String? name;
  String? addres;
  String? openingTime;
  String? closingTime;
  String? startingPrice;
  PlatformFile? otp;
  String? latitude;
  String? longitude;
}