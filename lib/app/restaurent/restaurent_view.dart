import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/reusable/card.dart';
import 'package:moksha_marg/reusable/dividers.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class RestaurentView extends StatelessWidget {
  const RestaurentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigaton(text: "Restaurent", isLeading: true),
      bottomNavigationBar: bottomNavigaton(),
      body: _body(),
      backgroundColor: ColorsResources.backgroundColor,
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
      child: Column(
        children: [
          searchBar(text: "Search Restaurent"),
          customDivider(),
          SizedBox(
            height:30,
            child: ListView.builder(
              // shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: card(text:"Veg"));
              },
            ),
          ),
          // card(text: "text"),
          customDivider(),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: Dimensions.padding16),
                    child: restaurentCard(
                        url: Images.temple1,
                        restaurentName: "Satvik Bhoj",
                        type: "Veg",
                        onPressed: () => Get.toNamed(RoutesHelper.getRestaurentDetails()),
                        rating: 4.3,
                        priceWithUnit: "200/per plate"),
                  );
                }),
          )
        ],
      ),
    );
  }
}

Widget card({required String text}) {
  return Container(
    height: 30,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ColorsResources.greyColor,
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.padding16,vertical:3),
      child: Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: TypographyResources.roboto,
        fontSize: Dimensions.font16,
        fontWeight: FontWeight.w500,
      ),)),
  );
}
