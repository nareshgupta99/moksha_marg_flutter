import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/dish/dish_controller.dart';
import 'package:moksha_marg/admin/dish/dish_dataservice.dart';
import 'package:moksha_marg/admin/restaurent/restarant_controller.dart';
import 'package:moksha_marg/app/cart/food_cart_controller.dart';
import 'package:moksha_marg/app/cart/food_cart_dataservice.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/response/food_cart_data.dart';
import 'package:moksha_marg/reusable/card.dart';
import 'package:moksha_marg/reusable/dividers.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/star_rating.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/network_image.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class RestaurentDetailsView extends StatefulWidget {
  String id;
  RestaurentDetailsView({super.key, required this.id});

  @override
  State<RestaurentDetailsView> createState() => _RestaurentDetailsViewState();
}

class _RestaurentDetailsViewState extends State<RestaurentDetailsView> {
  @override
  void initState() {
    super.initState();
    Get.find<RestarantController>().getRestaurantById(id: widget.id);
    Get.find<DishController>().getAllDishDataByRestaurant(id: widget.id);
    Get.find<FoodCartController>().getAllFromCart();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestarantController>(builder: (controller) {
      return Scaffold(
        appBar: topNavigaton(
            isLeading: true, text: controller.restaurantData?.name),
        bottomNavigationBar: bottomNavigaton(),
        body: Column(
          children: [
            _restaurentDetailsCard(
                isOpen: controller.restaurantData?.open ?? false,
                timing:
                    "${controller.restaurantData?.openingTime} - ${controller.restaurantData?.closeTime}",
                url: controller.restaurantData?.image ?? "",
                text: controller.restaurantData?.name ?? ""),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Menu Items",
                        style: TextStyle(
                            fontFamily: TypographyResources.roboto,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),

                      //list view of dish
                      GetBuilder<DishController>(builder: (controller) {
                        return GetBuilder<FoodCartController>(
                            builder: (foodCartController) {
                          return Expanded(
                            child: ListView.builder(
                                itemCount: controller.dishList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  FoodCartData? cartData = foodCartController
                                      .cartItems
                                      .firstWhereOrNull(
                                    (ele) =>
                                        controller.dishList[index].dishId ==
                                        ele.dishId,
                                  );

                                  return Column(
                                    children: [
                                      dishMenuItemsCard(
                                          addButton: () => foodCartController
                                              .addItemToFoodCart(
                                                  dishId: controller
                                                          .dishList[index]
                                                          .dishId ??
                                                      ""),
                                          subButton: (cartData?.quantity == 0 ||
                                                  cartData == null
                                              ? () {}
                                              : () => foodCartController
                                                  .removeOneFromCart(
                                                      cartItemId:
                                                          cartData.cartItemId ??
                                                              "")),
                                          quantity:
                                              "${cartData?.quantity ?? 0}",
                                          foodType:
                                              "${controller.dishList[index].foodTypes?.name}",
                                          availabelStatus: "Availabel",
                                          onPressed: () {},
                                          price:
                                              "${controller.dishList[index].price}",
                                          dishName:
                                              "${controller.dishList[index].dishName}",
                                          type:
                                              "${controller.dishList[index].foodTypes?.name}",
                                          url:
                                              "${controller.dishList[index].image}"),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.padding16),
                                        child: customDivider(),
                                      )
                                    ],
                                  );
                                }),
                          );
                        });
                      })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

Widget _restaurentDetailsCard(
    {required bool isOpen,
    required String url,
    required String text,
    required String timing}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: Dimensions.padding16, vertical: Dimensions.padding16),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      height: (Get.height) / 2.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: cachedImage(
                url: url,
                height: Get.width / 2,
                fit: BoxFit.fill,
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.padding16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: Dimensions.padding16,
                        bottom: Dimensions.padding12),
                    child: heading(text: text, fontSize: Dimensions.font18)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        StarRating(
                          starCount: 1,
                          rating: 1,
                          size: 18,
                        ),
                        Text("(4.5 / 5)")
                      ],
                    ),
                    Row(
                      children: [Icon(Icons.location_on), Text("2.5km away")],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.padding12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.clock_fill),
                      Text("${isOpen ? "open" : "close"}: $timing")
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
