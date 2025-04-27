import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantShimmer extends StatelessWidget {
  const RestaurantShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Shimmer(
        period: Duration(milliseconds: 2300),
        gradient: LinearGradient(colors: [
          Colors.grey.withOpacity(1),
          Colors.white.withOpacity(0.8)
        ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            children: [
              skelton(width: width, height: 60.r, borderRadius: 8.r),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.r),
                  child: skelton(width: width, height: 3.r)),
              SizedBox(
                height: 30.r,
                child: ListView.builder(
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    // itemCount: 5,
                    itemBuilder: (index, context) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.r),
                        child: skelton(
                            width: 55.r, height: 0.r, borderRadius: 15.r),
                      );
                    }),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 16.r),
                  child: skelton(width: width, height: 3.r)),
              Expanded(
                child: ListView.builder(itemBuilder: (index, context) {
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.r),
                      child: skelton(
                          width: width, height: 120.r, borderRadius: 8.r));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
