import 'package:get/get.dart';
import 'package:moksha_marg/app/cart/food_cart_dataservice.dart';
import 'package:moksha_marg/app/cart/food_cart_repository.dart';
import 'package:moksha_marg/network/response/food_cart_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodCartController extends GetxController implements GetxService {
  final FoodCartRepository repository;
  final SharedPreferences sharedPreferences;
  FoodCartController(
      {required this.sharedPreferences, required this.repository});

  bool loading = true;

  List<FoodCartData> cartItems = [];

  void getAllItemFromCart() {
    getAllFromCart();
  }

  void addItemToFoodCart({required String dishId}) {
    addToFoodCart(dishId: dishId, quantity: 1);
  }

  void removedItemFromCart({required String cartId}) {
    removeOneFromCart(cartItemId: cartId);
  }
}
