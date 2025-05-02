import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/temple_controller.dart';
import 'package:moksha_marg/app/home/temple_model.dart';
import 'package:moksha_marg/bootom_navigation_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/card.dart';
import 'package:moksha_marg/reusable/carousel.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/shimer/shimer_home.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Get.find<BootomNavigationController>().init();
    Get.find<TempleController>().getAllTemple();
  }

  List<String> images = [
    Images.food,
    Images.temple2,
    Images.guide,
    Images.maps,
    Images.temple5,
  ];

  List<TempleModel> title = [
    TempleModel(heading: "Food Ordering", subHeading: "Satvik Meal"),
    TempleModel(heading: "Live Darshan", subHeading: "Virtual Worship"),
    TempleModel(heading: "Guide Booking", subHeading: "Expert Guidance"),
    TempleModel(heading: "Temple Navigation", subHeading: "Route Assistance"),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<TempleController>(builder: (templeController) {
      return (templeController.loading)
          ? ShimerHome()
          : Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: topNavigaton(isLeading: false),
              backgroundColor: ColorsResources.backgroundColor,
              bottomNavigationBar: bottomNavigaton(),
              body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      customCarousel(
                          width: width, height: height / 5, images: images),
                      _body(context, templeController: templeController)
                    ],
                  )));
    });
  }

  Widget _body(BuildContext context,
      {required TempleController templeController}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 8.r, vertical: Dimensions.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // services section
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onTap(index);
                  },
                  child: _serviceCard(
                      url: images[index],
                      heading: title[index].heading,
                      desc: title[index].subHeading),
                );
              }),

          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimensions.padding16),
            child: Text("Live Darshan Now",
                style: TextStyle(
                    fontFamily: TypographyResources.roboto,
                    fontWeight: FontWeight.w900,
                    fontSize: Dimensions.font24)),
          ),

          // List View
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: templeController.temples.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(right: Dimensions.padding12),
                      child: GestureDetector(
                          onTap: () => Get.toNamed(RoutesHelper.getLiveDarshan(
                              temple: templeController.temples[index])),
                          child: livedarhanCard(
                              templeName:
                                  templeController.temples[index].name ?? "",
                              city: templeController.temples[index].city ?? "",
                              imageUri: templeController.temples[index].image ??
                                  "")));
                }),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Popular Destination ",
              style: TextStyle(
                  fontFamily: TypographyResources.roboto,
                  fontWeight: FontWeight.w900,
                  fontSize: 24),
            ),
          ),

          _destinationCard(
            url: images[0],
            name: "Tirupati Balaji",
            add: "Andhra Pradesh",
            onTap: () {},
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Nearby Food Service",
              style: TextStyle(
                  fontFamily: TypographyResources.roboto,
                  fontWeight: FontWeight.w900,
                  fontSize: 24),
            ),
          ),

          restaurentCard(
            url:
                "https://res.cloudinary.com/dnkci1bpn/image/upload/v1744529611/l8lmitpjashecngenalh.jpg",
            type: "Pure Vegetarian",
            rating: 4.5,
            priceWithUnit: "200 for two",
            restaurentName: "Satvik Bhoj",
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _serviceCard(
      {required String url, required String heading, required String desc}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              url,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            heading,
            style: TextStyle(
                fontFamily: TypographyResources.roboto,
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
          Text(
            desc,
            style: TextStyle(
                color: ColorsResources.greyColor,
                fontFamily: TypographyResources.roboto,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  Widget _destinationCard(
      {required String url,
      required String name,
      required String add,
      required VoidCallback onTap}) {
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
            child: Image.asset(
              images[0],
              width: Get.width,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: TypographyResources.roboto,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              add,
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
                      CupertinoIcons.building_2_fill,
                    ),
                    Text(
                      "50+ hotels",
                      style: TextStyle(
                          fontFamily: TypographyResources.roboto,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                customButton(
                    onPressed: () {},
                    text: "View Details",
                    width: 20,
                    height: 12)
              ],
            ),
          )
        ],
      ),
    );
  }
}

void onTap(int index) {
  switch (index) {
    case 0:
      Get.toNamed(RoutesHelper.getRestaurent());
      break;
    case 1:
      Get.toNamed(RoutesHelper.getTemple());
      break;
    case 2:
      Get.toNamed(RoutesHelper.getGuide());
      break;
    case 3:
      Get.toNamed(RoutesHelper.getTempleNavigationListingCard());
      break;
  }
}
