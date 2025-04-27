import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/temple_controller.dart';
import 'package:moksha_marg/bootom_navigation_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/reusable/card.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/shimer/temple_listing_shimmer.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/network_image.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class TempleListingView extends StatefulWidget {
  TempleListingView({super.key});

  @override
  State<TempleListingView> createState() => _TempleListingViewState();
}

class _TempleListingViewState extends State<TempleListingView> {
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
              resizeToAvoidBottomInset: false,
              appBar: topNavigaton(text: "Temples", isLeading: true),
              bottomNavigationBar: bottomNavigatonAdmin(),
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
                          onTap: () => Get.toNamed(RoutesHelper.getLiveDarshan(
                              temple: controller.temples[index])),
                          child: livedarhanCardAdmin(
                              edit: () {},
                              delete: () => controller.deletTemple(
                                  id: controller.temples[index].id ?? ""),
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

Widget livedarhanCardAdmin(
    {required String imageUri,
    double? width,
    double? height,
    required String templeName,
    required VoidCallback edit,
    required VoidCallback delete,
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
              padding: EdgeInsets.only(
                  top: Dimensions.padding16, right: Dimensions.padding16),
              child: Row(
                spacing: Dimensions.mainAxisSpacing16,
                children: [
                  Text(""),
                  GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: delete,
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ],
              ),
            )
          ],
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
        ),
      ],
    ),
  );
}
