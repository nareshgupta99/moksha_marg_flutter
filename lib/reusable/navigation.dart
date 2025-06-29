import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/bootom_navigation_controller.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/typography_resources.dart';

PreferredSizeWidget topNavigaton(
    {String? text, required bool isLeading, String? appUrl}) {
  return AppBar(
    leading: isLeading == true
        ? GestureDetector(
            onTap: () => Get.back(), child: Icon(Icons.arrow_back))
        : Padding(
            padding: EdgeInsets.all(6.r),
            child: Image.asset(
              Images.appIcon,
            ),
          ),
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        // Image.asset(
        //   Images.appIcon,
        //   heig,
        // ),
        Text(
          text ?? "MokshaMarg",
          style: TextStyle(
              fontFamily: TypographyResources.pacifico,
              fontWeight: FontWeight.w900),
        ),
      ],
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
              icon: Icon(CupertinoIcons.video_camera_solid), label: "Live"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
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
              icon: Icon(CupertinoIcons.video_camera_solid), label: "Add New"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ]);
  });
}

Widget bottomNavigatonAdmin() {
  return GetBuilder<BootomNavigationController>(builder: (controller) {
    return BottomNavigationBar(
        currentIndex: controller.selectedIndex,
        onTap: (value) {
          controller.setAdminIndex(value);
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
            label: "Temples",
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.video_camera_solid),
              label: "Add New Temples"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ]);
  });
}

Widget bottomNavigatonGuide() {
  return GetBuilder<BootomNavigationController>(builder: (controller) {
    return BottomNavigationBar(
        currentIndex: controller.selectedIndex,
        onTap: (value) {
          controller.setGuideIndex(value);
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
            label: "Temples",
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.video_camera_solid),
              label: "Add New Temples"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ]);
  });
}
