import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/label.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/food_type_enum.dart';
import 'package:moksha_marg/util/network_image.dart';
import 'package:moksha_marg/util/typography_resources.dart';

Widget restaurentCard(
    {required String url,
    required restaurentName,
    required String type,
    required VoidCallback onPressed,
    required double rating,
    required String priceWithUnit}) {
  return Container(
    // margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8)),
    width: Get.width,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: cachedImage(
                url: url,
                width: 120,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                restaurentName,
                style: TextStyle(
                  fontFamily: TypographyResources.roboto,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                type,
                style: TextStyle(
                  fontFamily: TypographyResources.roboto,
                  color: ColorsResources.greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star_purple500_sharp, color: Colors.yellow),
                  Text("$rating"),
                  Icon(Icons.currency_rupee_rounded),
                  Text(priceWithUnit)
                ],
              )
            ],
          ),
          customButton(onPressed: onPressed, text: "Order")
        ],
      ),
    ),
  );
}

Widget livedarhanCard(
    {required String imageUri, double? width, double? height}) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(8)),
    width: width ?? Get.width / 1.5,
    height: height ?? Get.width / 1.5,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          child: Image.asset(
            imageUri,
            width: Get.width,
            height: Get.width / 2.5,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16, left: 16),
          child: Text(
            "Sidhivinayak Temple",
            style: TextStyle(
                fontFamily: TypographyResources.roboto,
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            "Mumbai, Maharastra",
            style: TextStyle(
                color: ColorsResources.greyColor,
                fontFamily: TypographyResources.roboto,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16, left: 16),
          child: Row(
            spacing: 8,
            children: [
              Icon(
                CupertinoIcons.eye_fill,
                color: ColorsResources.greyColor,
              ),
              Text(
                "2.4k watching",
                style: TextStyle(
                    color: ColorsResources.greyColor,
                    fontFamily: TypographyResources.roboto,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget dishMenuItemsCard(
    {String? foodType,
    required String url,
    required dishName,
    required String type,
    required VoidCallback onPressed,
    required String availabelStatus,
    required String price}) {
  print("food :: $foodType");
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
              child: cachedImage(
                url: url,
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
                    (foodType == FoodTypeEnum.VEG.name
                        ? label(
                            text: "Veg",
                            backGroundColor: ColorsResources.lightGreenColor,
                            textColor: ColorsResources.darkGreenColor)
                        : label(
                            text: "Non-Veg",
                            backGroundColor: ColorsResources.lightRedColor,
                            textColor: ColorsResources.darkRedColor))
                    // label(
                    //     text: "few Left",
                    //     backGroundColor: ColorsResources.lightOrangeColor,
                    //     textColor: ColorsResources.darkOrangeColor),
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

Widget deliveryAddressCard() {
  return Container(
    decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding16, vertical: Dimensions.padding12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading(text: "Contact Details"),
          customTextField(
              textFieldLabel: "",
              controller: TextEditingController(),
              hintText: "Full Name"),
          customTextField(
              textFieldLabel: "",
              controller: TextEditingController(),
              hintText: "Phone Number"),
          customTextField(
              textFieldLabel: "",
              controller: TextEditingController(),
              hintText: "Email Address"),
        ],
      ),
    ),
  );
}
