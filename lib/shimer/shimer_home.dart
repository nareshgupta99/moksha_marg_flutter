import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/skeleton.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:shimmer/shimmer.dart';

class ShimerHome extends StatelessWidget {
  const ShimerHome({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return Scaffold(
      body: Shimmer(
        period: Duration(milliseconds: 2300),
        gradient: LinearGradient(colors: [
          Colors.grey.withOpacity(0.9),
          Colors.white.withOpacity(0.6)
        ]),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              skelton(height: height / 5, width: width),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8.r, vertical: Dimensions.padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          return skelton(height: 100.r, width: 100.r);
                        }),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.padding16),
                        child: skelton(
                            height: 20.r, width: 120.r, borderRadius: 6.r)),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(right: Dimensions.padding12),
                              child: skelton(
                                  height: width / 1.5, width: width / 1.5),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
}
