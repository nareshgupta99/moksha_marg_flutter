import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/network_image.dart';

class BannerListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: topNavigaton(isLeading: false),
        bottomNavigationBar: bottomNavigatonAdmin(),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (index, context) {
              return _bannerListingCard(
                imageUri: "",
                delete: () => {},
              );
            }));
  }
}

Widget _bannerListingCard({
  required String imageUri,
  double? width,
  double? height,
  required VoidCallback delete,
}) {
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
      ],
    ),
  );
}
