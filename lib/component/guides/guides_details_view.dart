import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/star_rating.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class GuidesDetailsView extends StatelessWidget {
  const GuidesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigaton(text: "Tourist Guides"),
      body: SingleChildScrollView(child: _body()),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        // spacing: 2,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Images.temple2, height: Get.width / 2, width: Get.width),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: heading(text: "Tomb", fontSize: 32),
          ),
          Row(
            children: [
              StarRating(
                starCount: 5,
                rating: 4.5,
                size: 18,
              ),
              Text("(4.5 / 5 - 128 reviews)")
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: heading(text: "About"),
          ),
          Text(
              style: TextStyle(
                  fontFamily: TypographyResources.roboto,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorsResources.textGreyColor),
              "Explore the city's hidden gems with our expert local guides. Discover historical landmarks, secret spots, and fascinating stories about the city's culture and heritage."),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: heading(text: "Languages Spoken"),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorsResources.textFieldBorderColor,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Text(
              "English",
              style: TextStyle(
                fontFamily: TypographyResources.roboto,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: heading(text: "Price"),
          ),
          Row(
            children: [
              Icon(Icons.currency_rupee, size: 32),
              heading(text: "1999", fontSize: 32),
              Text(
                "/person",
                style: TextStyle(
                    fontFamily: TypographyResources.roboto,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorsResources.textGreyColor),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: heading(text: "Duration"),
          ),
          Text("3 Hour"),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: customButton(
                onPressed: () {}, text: "Book Now", width: Get.width),
          )
        ],
      ),
    );
  }
}
