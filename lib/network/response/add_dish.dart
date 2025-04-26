class DishData {
  String? dishId;
  String? dishName;
  String? image;
  FoodTypes? foodTypes;
  double? price;
  String? description;
  String? shortDescription;

  DishData({
    this.dishId,
    this.dishName,
    this.image,
    this.foodTypes,
    this.price,
    this.description,
    this.shortDescription,
  });

  factory DishData.fromJson(Map<String, dynamic> json) => DishData(
        dishId: json["dishId"],
        dishName: json["dishName"],
        image: json["image"],
        foodTypes: json["foodTypes"] == null
            ? null
            : FoodTypes.fromJson(json["foodTypes"]),
        price: json["price"]?.toDouble(),
        description: json["description"],
        shortDescription: json["shortDescription"],
      );

  Map<String, dynamic> toJson() => {
        "dishId": dishId,
        "dishName": dishName,
        "image": image,
        "foodTypes": foodTypes?.toJson(),
        "price": price,
        "description": description,
        "shortDescription": shortDescription,
      };
}

class FoodTypes {
  String? foodTypeId;
  String? name;

  FoodTypes({
    this.foodTypeId,
    this.name,
  });

  factory FoodTypes.fromJson(Map<String, dynamic> json) => FoodTypes(
        foodTypeId: json["foodTypeId"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "foodTypeId": foodTypeId,
        "name": name,
      };
}
