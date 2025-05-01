import 'dart:core';

class LoginData {
  String? userId;
  String? name;
  String? email;
  String? type;
  String? token;
  String? roles;
  bool? isGuideAdded;
  bool? isRestaurentAdded;
  String? restaurantId;
  String? image;
  String? guideId;

  LoginData(
      {this.userId,
      this.name,
      this.email,
      this.type,
      this.token,
      this.roles,
      this.isGuideAdded,
      this.isRestaurentAdded,
      this.restaurantId,
      this.image,
      this.guideId,
      });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
      userId: json["userId"],
      name: json["name"],
      email: json["email"],
      type: json["type"],
      token: json["token"],
      roles: json["roles"],
      isGuideAdded: json['isGuideAdded'],
      isRestaurentAdded: json['isRestaurentAdded'],
      restaurantId: json["restaurantId"],
      image: json["image"],
      guideId: json["guideId"]);

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "email": email,
        "type": type,
        "token": token,
        "roles": roles,
        "isGuideAdded": isGuideAdded,
        "isRestaurentAdded": isRestaurentAdded,
        "restaurantId": restaurantId,
        "image": image,
        "guideId":guideId,
      };
}
