import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/bootom_navigation_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/reusable/card.dart';
import 'package:moksha_marg/reusable/dividers.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class LiveDarshanView extends StatefulWidget {
  String id;
  LiveDarshanView({super.key, required this.id});

  @override
  State<LiveDarshanView> createState() => _LiveDarshanViewState();
}

class _LiveDarshanViewState extends State<LiveDarshanView> {
  List<String> images = [
    Images.temple1,
    Images.temple2,
    Images.temple3,
    Images.temple4,
    Images.temple5,
  ];

  @override
  void initState() {
    super.initState();
    Get.find<BootomNavigationController>().init();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigaton(text: "Live Darshan", isLeading: true),
      bottomNavigationBar: bottomNavigaton(),
      body: _body(),
      backgroundColor: ColorsResources.backgroundColor,
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
           Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      width:  Get.width ,
      height: Get.width /1.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.padding12),
           child: Container(
            height: Get.width / 2.1,
            color: Colors.amber,
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
    )
        ],
      ),
    );
  }
}

