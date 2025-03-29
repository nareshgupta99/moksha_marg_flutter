import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/util/colors_resources.dart';
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
                child: Image.asset(
                  url,
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
