import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/temple_controller.dart';
import 'package:moksha_marg/bootom_navigation_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/shimer/temple_listing_shimmer.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/network_image.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class TemplesNavigationListing extends StatefulWidget {
  const TemplesNavigationListing({super.key});

  @override
  State<TemplesNavigationListing> createState() =>
      _TemplesNavigationListingState();
}

class _TemplesNavigationListingState extends State<TemplesNavigationListing> {
  @override
  void initState() {
    super.initState();
    Get.find<BootomNavigationController>().init();
    Get.find<TempleController>().init();
    Get.find<TempleController>().getAllTemple();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TempleController>(builder: (controller) {
      return (controller.loading)
          ? TempleListingShimmer()
          : Scaffold(
              appBar: topNavigaton(text: "Temples", isLeading: true),
              bottomNavigationBar: bottomNavigaton(),
              body: _body(controller),
              backgroundColor: ColorsResources.backgroundColor,
            );
    });
  }

  Widget _body(TempleController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          searchBar(text: "Search Temple"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.padding16),
              child: ListView.builder(
                  itemCount: controller.temples.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(bottom: Dimensions.padding16),
                        child: GestureDetector(
                          onTap: () =>
                              Get.toNamed(RoutesHelper.getNavigationScreen(longitude: controller.temples[index].longitude??"77.69467120810941",latitude:controller.temples[index].latitude??"28.957938774409847" )),
                          child: _templeNavigationCard(
                              templeName: controller.temples[index].name ?? "",
                              city: controller.temples[index].city ?? "",
                              imageUri: controller.temples[index].image ?? ""),
                        ));
                  }),
            ),
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
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.padding16, vertical: 3),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: TypographyResources.roboto,
            fontSize: Dimensions.font16,
            fontWeight: FontWeight.w500,
          ),
        )),
  );
}

Widget _templeNavigationCard(
    {required String imageUri,
    double? width,
    double? height,
    required String templeName,
    required String city}) {
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
          child: cachedImage(
            url: imageUri,
            width: Get.width,
            height: Get.width / 2.5,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16, left: 16),
          child: Text(
            templeName,
            style: TextStyle(
                fontFamily: TypographyResources.roboto,
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            city,
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
                Icons.location_on,
                color: Colors.green,
              )

              // Text(
              //   "2.4k watching",
              //   style: TextStyle(
              //       color: ColorsResources.greyColor,
              //       fontFamily: TypographyResources.roboto,
              //       fontSize: 12,
              //       fontWeight: FontWeight.w700),
              // )
            ],
          ),
        )
      ],
    ),
  );
}
