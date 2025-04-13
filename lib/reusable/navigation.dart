import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/bootom_navigation_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/typography_resources.dart';

PreferredSizeWidget topNavigaton({String? text, required bool isLeading}) {
  return AppBar(
    leading: isLeading == true
        ? GestureDetector(
            onTap: () => Get.back(), child: Icon(Icons.arrow_back))
        : Text(""),
    automaticallyImplyLeading: false,
    title: Text(
      text ?? "MokshaMarg",
      style: TextStyle(
          fontFamily: TypographyResources.pacifico,
          fontWeight: FontWeight.w900),
    ),
  );
}

Widget bottomNavigaton() {
  return GetBuilder<BootomNavigationController>(builder: (controller) {
    return BottomNavigationBar(
        currentIndex: controller.selectedIndex,
        onTap: (value) {
          controller.setSelectedIndex(value);
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: ColorsResources.greyColor,
        selectedLabelStyle: TextStyle(color: Colors.black),
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(
          color: ColorsResources.greyColor,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Guides",
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.video_camera_solid),
              label: "Live"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"),
        ]);
  });
}


Widget bottomNavigatonRestaurent() {
  return GetBuilder<BootomNavigationController>(builder: (controller) {
    return BottomNavigationBar(
        currentIndex: controller.selectedIndex,
        onTap: (value) {
          controller.setRestaurentSelectedIndex(value);
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: ColorsResources.greyColor,
        selectedLabelStyle: TextStyle(color: Colors.black),
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(
          color: ColorsResources.greyColor,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "DashBoard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "orders",
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.video_camera_solid),
              label: "Add New"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"),
        ]);
  });
}