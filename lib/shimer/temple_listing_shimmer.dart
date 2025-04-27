import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/skeleton.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:shimmer/shimmer.dart';

class TempleListingShimmer extends StatelessWidget {
  const TempleListingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Shimmer(
            period: Duration(milliseconds: 2300),
            gradient: LinearGradient(colors: [
              Colors.grey.withOpacity(1),
              Colors.white.withOpacity(0.8)
            ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  skelton(width: width, height: 60.r, borderRadius: 8.r),
                  Padding(
                    padding: EdgeInsets.only(top: 16.r),
                    child: skelton(width: width, height: 4.r)),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: Dimensions.padding16),
                      child: ListView.builder(itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.only(bottom: Dimensions.padding16),
                          child: Column(
                            children: [
                              skelton(width: width, height: width / 1.5),
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
