import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/app/cart/food_cart_controller.dart';
import 'package:moksha_marg/app/cart/food_cart_dataservice.dart';
import 'package:moksha_marg/app/cart/order_cart_controller.dart';
import 'package:moksha_marg/network/response/food_cart_data.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/card.dart';
import 'package:moksha_marg/reusable/dividers.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class FoodCartView extends StatefulWidget {
  const FoodCartView({super.key});

  @override
  State<FoodCartView> createState() => _FoodCartViewState();
}

class _FoodCartViewState extends State<FoodCartView> {
  @override
  void initState() {
    super.initState();
    Get.find<FoodCartController>().getAllItemFromCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: topNavigaton(isLeading: true, text: "Food Order"),
      bottomNavigationBar: bottomNavigaton(),
      body: _body(),
    );
  }

  Widget _body() {
    return GetBuilder<FoodCartController>(builder: (Controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.padding16),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensions.padding16),
                child: ListView.builder(
                    itemCount: Controller.cartItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return dishMenuItemsCard(
                        foodType: Controller.cartItems[index].foodType,
                        addButton: () => Controller.addItemToFoodCart(
                            dishId: Controller.cartItems[index].dishId ?? ""),
                        subButton: () => Controller.removeOneFromCart(
                            cartItemId:
                                Controller.cartItems[index].cartItemId ?? ""),
                        availabelStatus: "Availabel",
                        quantity: "${Controller.cartItems[index].quantity}",
                        onPressed: () {},
                        price: "${Controller.cartItems[index].price}",
                        dishName: Controller.cartItems[index].itemName,
                        type: Controller.cartItems[index].foodType ?? "",
                        url: Controller.cartItems[index].image ?? "",
                      );
                    }),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ColorsResources.greyColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.padding16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.padding16),
                        child: heading(text: "Food Preferences"),
                      ),
                      ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: 4,
                          itemBuilder: (ele, index) {
                            return Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                Text("Spicy")
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensions.padding16),
                child: deliveryAddressCard(),
              ),
              _paymentSummaryCard(Controller.cartItems)
            ],
          ),
        ),
      );
    });
  }
}

Widget _paymentSummaryCard(List<FoodCartData> cartItems) {
  double total = 0;
  cartItems.forEach((ele) {
    total += (ele.price ?? 1) * (ele.quantity ?? 1);
  });
  return Container(
    decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding16, vertical: Dimensions.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Dimensions.padding16),
            child: heading(text: "Payment Summary"),
          ),
          customDivider(),
          ListView.builder(
            itemCount: cartItems.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cartItems[index].itemName ?? ""),
                  Text(
                      "${(cartItems[index].price ?? 1) * (cartItems[index].quantity ?? 1)}")
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Total Amount"), Text("$total")],
          ),
          GetBuilder<OrderCartController>(builder: (orderController) {
            return customButton(
                onPressed: () {
                  orderController.createOrderForFood(amount: total);
                },
                text: "order",
                width: Get.width);
          })
        ],
      ),
    ),
  );
}
