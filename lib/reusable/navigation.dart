import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/typography_resources.dart';

PreferredSizeWidget topNavigaton({String? text,required bool isLeading}) {
  return AppBar(
    leading:isLeading == true? GestureDetector(
      onTap: () => Get.back(),
      child: Icon(Icons.arrow_back)):Text(""),
    automaticallyImplyLeading: false,
    title: Text(text??"MpkshaMarg", style: TextStyle(
      fontFamily: TypographyResources.pacifico,
      fontWeight: FontWeight.w900
    ),),
  );
}

Widget bottomNavigaton(int index) {
  return BottomNavigationBar(
    currentIndex: index,
    selectedItemColor: Colors.black,
    unselectedItemColor: ColorsResources.greyColor,
    selectedLabelStyle: TextStyle(
      color: Colors.black
    ),
    type: BottomNavigationBarType.fixed,
    unselectedLabelStyle: TextStyle(
      color: ColorsResources.greyColor,
    ),

    items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home" ,),
    BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Booking"),
    BottomNavigationBarItem( icon: Icon(CupertinoIcons.video_camera_solid), label: "Live"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ]);
}
