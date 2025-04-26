class FoodCartData {
  String? cartItemId;
  String? itemName;
  int? quantity;
  double? price;
  String? image;
  String? foodType;
  String? dishId;

  FoodCartData(
      {this.cartItemId,
      this.itemName,
      this.quantity,
      this.price,
      this.image,
      this.foodType,
      this.dishId});

  factory FoodCartData.fromJson(Map<String, dynamic> json) => FoodCartData(
        cartItemId: json["cartItemId"],
        itemName: json["itemName"],
        quantity: json["quantity"],
        price: json["price"],
        image: json["image"],
        foodType: json["foodType"],
        dishId: json["dishId"],
      );

  Map<String, dynamic> toJson() => {
        "cartItemId": cartItemId,
        "itemName": itemName,
        "quantity": quantity,
        "price": price,
        "image": image,
        "foodType": foodType,
        "dishId": dishId,
      };
}
