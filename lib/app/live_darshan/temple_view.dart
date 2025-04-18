import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/temple_controller.dart';
import 'package:moksha_marg/bootom_navigation_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/reusable/card.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class TempleView extends StatefulWidget {
  TempleView({super.key});

  @override
  State<TempleView> createState() => _TempleViewState();
}

class _TempleViewState extends State<TempleView> {
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
    Get.find<TempleController>().init();
    Get.find<TempleController>().getAllTemple();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigaton(text: "Temples", isLeading: true),
      bottomNavigationBar: bottomNavigaton(),
      body: _body(),
      backgroundColor: ColorsResources.backgroundColor,
    );
  }

  Widget _body() {
    return GetBuilder<TempleController>(builder: (controller) {
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
                          padding:
                              EdgeInsets.only(bottom: Dimensions.padding16),
                          child: GestureDetector(
                            onTap: () => Get.toNamed(
                                RoutesHelper.getLiveDarshan(temple: controller.temples[index])),
                            child: livedarhanCard(
                                templeName:
                                    controller.temples[index].name ?? "",
                                city: controller.temples[index].city ?? "",
                                imageUri:
                                    controller.temples[index].image ?? ""),
                          ));
                    }),
              ),
            )
          ],
        ),
      );
    });
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
