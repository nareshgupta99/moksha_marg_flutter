import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/dish/dish_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/network/response/add_dish.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/network_image.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class DishListing extends StatefulWidget {
  const DishListing({super.key});

  @override
  State<DishListing> createState() => _DishListingState();
}

class _DishListingState extends State<DishListing> {
  @override
  void initState() {
    super.initState();
    Get.find<DishController>().init();
    Get.find<DishController>().getAllDishByRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DishController>(builder: (controller) {
      return Scaffold(
        appBar: topNavigaton(isLeading: true),
        body: _body(controller),
        bottomNavigationBar: bottomNavigatonRestaurent(),
      );
    });
  }

  Widget _body(DishController controller) {
    return Column(children: [
      heading(text: "Dish"),
      Expanded(
        child: ListView.builder(
            itemCount: controller.dishList.length,
            shrinkWrap: true,
            itemBuilder: (element, index) {
              return Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.padding16,
                    left: Dimensions.padding16,
                    right: Dimensions.padding16),
                child: _dishCard(
                    dish: controller.dishList[index], controller: controller),
              );
            }),
      )
    ]);
  }

  Widget _dishCard(
      {required DishController controller, required DishData dish}) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(8)),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: cachedImage(
              url: dish.image ?? "",
              height: Get.width / 2,
              width: Get.width,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: Text(
              dish.dishName ?? "",
              style: TextStyle(
                  fontFamily: TypographyResources.roboto,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              dish.shortDescription ?? "",
              style: TextStyle(
                  color: ColorsResources.greyColor,
                  fontFamily: TypographyResources.roboto,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 8,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.money_dollar,
                    ),
                    Text(
                      " ${dish.price}",
                      style: TextStyle(
                          fontFamily: TypographyResources.roboto,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  spacing: Dimensions.mainAxisSpacing16,
                  children: [
                    GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Get.toNamed(RoutesHelper.getEditDish(dish: dish));
                        },
                        child: Icon(
                          Icons.edit_square,
                          color: Colors.blue,
                        )),
                    GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () =>
                            controller.deleteDish(id: dish.dishId ?? ""),
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
