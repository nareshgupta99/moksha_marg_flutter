class RestaurantData {
  String? restaurantId;
  String? name;
  String? address;
  bool? open;
  String? openingTime;
  String? closeTime;
  dynamic latitude;
  dynamic longitude;
  String? image;
  String? startingPrice;
  dynamic dishes;
  List<FoodType>? foodTypes;

  RestaurantData({
    this.restaurantId,
    this.name,
    this.address,
    this.open,
    this.openingTime,
    this.closeTime,
    this.latitude,
    this.longitude,
    this.image,
    this.startingPrice,
    this.dishes,
    this.foodTypes,
  });

  factory RestaurantData.fromJson(Map<String, dynamic> json) => RestaurantData(
        restaurantId: json["restaurantId"],
        name: json["name"],
        address: json["address"],
        open: json["open"],
        openingTime: json["openingTime"],
        closeTime: json["closeTime"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        image: json["image"],
        startingPrice: json["startingPrice"],
        dishes: json["dishes"],
        foodTypes: json["foodTypes"] == null
            ? []
            : List<FoodType>.from(
                json["foodTypes"].map((x) => FoodType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "name": name,
        "address": address,
        "open": open,
        "openingTime": openingTime,
        "closeTime": closeTime,
        "latitude": latitude,
        "longitude": longitude,
        "image": image,
        "startingPrice": startingPrice,
        "dishes": dishes,
        "foodTypes": foodTypes == null
            ? []
            : List<dynamic>.from(foodTypes!.map((x) => x.toJson())),
      };
}

class FoodType {
  String? foodTypeId;
  String? name;

  FoodType({
    this.foodTypeId,
    this.name,
  });

  factory FoodType.fromJson(Map<String, dynamic> json) => FoodType(
        foodTypeId: json["foodTypeId"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "foodTypeId": foodTypeId,
        "name": name,
      };
}
