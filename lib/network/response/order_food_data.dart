class OrderFoodData {
  int? foodOrderId;
  DateTime? orderDate;
  String? restaurantName;
  String? method;
  String? razorpayOrderId;
  double? amount;
  String? currency;
  String? razorpayRecipt;
  String? userEmail;

  OrderFoodData({
    this.foodOrderId,
    this.orderDate,
    this.restaurantName,
    this.method,
    this.razorpayOrderId,
    this.amount,
    this.currency,
    this.razorpayRecipt,
    this.userEmail,
  });

  factory OrderFoodData.fromJson(Map<String, dynamic> json) => OrderFoodData(
        foodOrderId: json["foodOrderId"],
        orderDate: json["orderDate"] == null
            ? null
            : DateTime.parse(json["orderDate"]),
        restaurantName: json["restaurantName"],
        method: json["method"],
        razorpayOrderId: json["razorpayOrderId"],
        amount: json["amount"],
        currency: json["currency"],
        razorpayRecipt: json["razorpayRecipt"],
        userEmail: json["userEmail"],
      );

  Map<String, dynamic> toJson() => {
        "foodOrderId": foodOrderId,
        "orderDate": orderDate?.toIso8601String(),
        "restaurantName": restaurantName,
        "method": method,
        "razorpayOrderId": razorpayOrderId,
        "amount": amount,
        "currency": currency,
        "razorpayRecipt": razorpayRecipt,
        "userEmail": userEmail,
      };
}
