import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/dividers.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/star_rating.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class RestaurentDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigaton(isLeading: true, text: "Satvik Bhoj"),
      bottomNavigationBar: bottomNavigaton(2),
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
                            _menueItems(
                                availabelStatus: "Availabel",
                                onPressed: () {},
                                price: "200",
                                dishName: "Maghrita Pizza ",
                                type: "Veg",
                                url: Images.temple1),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: Dimensions.padding16),
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

Widget _menueItems(
    {required String url,
    required dishName,
    required String type,
    required VoidCallback onPressed,
    required String availabelStatus,
    required String price}) {
  return Container(
    // margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8)),
    width: Get.width,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image.asset(
                url,
                width: 120,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.padding16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    
                    label(
                        text: "Non-Veg",
                        backGroundColor: ColorsResources.lightRedColor,
                        textColor: ColorsResources.darkRedColor),
                    label(
                        text: "few Left",
                        backGroundColor: ColorsResources.lightOrangeColor,
                        textColor: ColorsResources.darkOrangeColor),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.padding10),
                  child: Text(
                    dishName,
                    style: TextStyle(
                      fontFamily: TypographyResources.roboto,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Dimensions.padding12),
                  child: Row(
                    children: [Icon(Icons.currency_rupee_rounded), Text(price)],
                  ),
                ),
                Row(
                  spacing: 8,
                  children: [
                    circularButton(
                        onPressed: () {}, iconData: CupertinoIcons.minus),
                    Text(price),
                    circularButton(onPressed: () {}, iconData: Icons.add),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}

Widget label(
    {required String text,
    required Color backGroundColor,
    required Color textColor}) {
  return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.padding4, horizontal: Dimensions.padding12),
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
      child: Text(text, style: TextStyle(color: textColor)));
}
