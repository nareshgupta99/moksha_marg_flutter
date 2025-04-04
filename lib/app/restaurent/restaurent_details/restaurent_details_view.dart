import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/reusable/card.dart';
import 'package:moksha_marg/reusable/dividers.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/star_rating.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class RestaurentDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigaton(isLeading: true, text: "Satvik Bhoj"),
      bottomNavigationBar: bottomNavigaton(),
      body: Column(
        children: [
          _restaurentDetailsCard(url: Images.temple1, text: "Satvik Bhoj"),
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
                    Expanded(
                      child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: ()=>Get.toNamed(RoutesHelper.getFoodCart()),
                                  child: dishMenuItemsCard(
                                      availabelStatus: "Availabel",
                                      onPressed: () {},
                                      price: "200",
                                      dishName: "Maghrita Pizza ",
                                      type: "Veg",
                                      url: Images.temple1),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.padding16),
                                  child: customDivider(),
                                )
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _restaurentDetailsCard({required String url, required String text}) {
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
              child: Image.asset(
                url,
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
                      Text("open: 10AM- 11PM")
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

