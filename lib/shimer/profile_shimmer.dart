// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:moksha_marg/reusable/skeleton.dart';
// import 'package:moksha_marg/util/dimensions.dart';
// import 'package:shimmer/shimmer.dart';

// class ProfileShimmer extends StatelessWidget {
//   const ProfileShimmer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           titleSpacing: 0,
//           title: Shimmer(
//             period: Duration(milliseconds: 2300),
//             gradient: LinearGradient(colors: [
//               Colors.grey.withOpacity(0.9),
//               Colors.white.withOpacity(0.8)
//             ]),
//             child: Container(
//               width: Get.width,
//               height: 100.r,
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.4),
//               ),
//             ),
//           ),
//           // backgroundColor: Colors.black.withOpacity(0.3),
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: Dimensions.padding16, vertical: Dimensions.padding16),
//           child: Container(
//             decoration: BoxDecoration(
//                 color: const Color.fromRGBO(255, 255, 255, 1),
//                 borderRadius: BorderRadius.circular(8)),
//             child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: Dimensions.padding16,
//                     vertical: Dimensions.padding16),
//                 child: Expanded(
//                   child: Shimmer(
//                     period: Duration(milliseconds: 2300),
//                     gradient: LinearGradient(colors: [
//                       Colors.grey.withOpacity(0.9),
//                       Colors.white.withOpacity(0.8)
//                     ]),
//                     child: Column(
//                       children: [
//                         _header(),
//                         Padding(
//                             padding: EdgeInsets.only(top: Dimensions.padding32),
//                             child: skelton(
//                                 width: 90.r, height: 20.r, borderRadius: 8.r)),
//                         Expanded(
//                           child:
//                               ListView.builder(itemBuilder: (element, index) {
//                             return Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 16.r),
//                                 child: skelton(width: Get.width, height: 60.r));
//                           }),
//                         )
//                       ],
//                     ),
//                   ),
//                 )),
//           ),
//         ));
//   }

//   Widget _header() {
//     return Row(
//       children: [
//         skelton(width: 120.r, height: 120.r, borderRadius: 60.r),
//         Padding(
//           padding: EdgeInsets.only(left: Dimensions.padding16),
//           child: Column(
//             children: [
//               skelton(width: 90.r, height: 20.r, borderRadius: 8.r),
//               Padding(
//                   padding: EdgeInsets.symmetric(vertical: Dimensions.padding16),
//                   child:
//                       skelton(width: 120.r, height: 20.r, borderRadius: 8.r)),
//               skelton(width: 120.r, height: 50.r, borderRadius: 8.r),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/skeleton.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: shimmerWrapper(
          child: Container(
            width: Get.width,
            height: 100.r,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding16,
          vertical: Dimensions.padding16,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.padding16,
              vertical: Dimensions.padding16,
            ),
            child: Column(
              children: [
                shimmerWrapper(child: _header()),
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.padding32),
                  child: shimmerWrapper(
                    child: skelton(
                      width: 90.r,
                      height: 20.r,
                      borderRadius: 8.r,
                    ),
                  ),
                ),
                SizedBox(height: 16.r),
                Expanded(
                  child: shimmerWrapper(
                    child: ListView.builder(
                      itemCount: 5, // placeholder item count
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.r),
                          child: skelton(
                            width: Get.width,
                            height: 60.r,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Extract shimmer wrapper for reuse
  Widget shimmerWrapper({required Widget child}) {
    return Shimmer(
      period: Duration(milliseconds: 2300),
      gradient: LinearGradient(
        colors: [
          Colors.grey.withOpacity(0.9),
          Colors.white.withOpacity(0.8),
        ],
      ),
      child: child,
    );
  }

  /// Header with circular avatar and text placeholders
  Widget _header() {
    return Row(
      children: [
        skelton(
          width: 120.r,
          height: 120.r,
          borderRadius: 60.r,
        ),
        Padding(
          padding: EdgeInsets.only(left: Dimensions.padding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              skelton(width: 90.r, height: 20.r, borderRadius: 8.r),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensions.padding16),
                child: skelton(width: 120.r, height: 20.r, borderRadius: 8.r),
              ),
              skelton(width: 120.r, height: 50.r, borderRadius: 8.r),
            ],
          ),
        ),
      ],
    );
  }
}
