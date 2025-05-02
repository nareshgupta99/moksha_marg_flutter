import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/guides/guides_controller.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/star_rating.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class GuidesDetailsView extends StatefulWidget {
  String guideId;
  GuidesDetailsView({super.key, required this.guideId});

  @override
  State<GuidesDetailsView> createState() => _GuidesDetailsViewState();
}

class _GuidesDetailsViewState extends State<GuidesDetailsView> {
  @override
  void initState() {
    super.initState();
    Get.find<GuidesController>().getGuide(id: widget.guideId);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuidesController>(builder: (controller) {
      return Scaffold(
        appBar: topNavigaton(text: "Tourist Guides", isLeading: true),
        body: SingleChildScrollView(child: _body(controller)),
      );
    });
  }

  Widget _body(GuidesController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding16, vertical: Dimensions.padding16),
      child: Column(
        // spacing: 2,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Images.temple2, height: Get.width / 2, width: Get.width),
          Padding(
            padding: EdgeInsets.only(top: Dimensions.padding16),
            child:
                heading(text: controller.guideData?.name ?? "", fontSize: 32.r),
          ),
          Row(
            children: [
              StarRating(
                starCount: 5,
                rating: 4.5,
                size: 18,
              ),
              Text("(4.5 / 5 - 128 reviews)")
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: heading(text: "About"),
          ),
          Text(
              style: TextStyle(
                  fontFamily: TypographyResources.roboto,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorsResources.textGreyColor),
              // "Explore the city's hidden gems with our expert local guides. Discover historical landmarks, secret spots, and fascinating stories about the city's culture and heritage.",
              controller.guideData?.discription ?? ""),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: heading(text: "Languages Spoken"),
          ),
          SizedBox(
            height: 35.r,
            child: ListView.builder(
                itemCount: controller.guideData?.languages?.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.padding6),
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: ColorsResources.textFieldBorderColor,
                        borderRadius: BorderRadius.all(Radius.circular(30.r)),
                      ),
                      child: Text(
                        controller.guideData?.languages?[index].languageName ??
                            "",
                        style: TextStyle(
                          fontFamily: TypographyResources.roboto,
                          fontSize: 14.r,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Padding(
              padding: EdgeInsets.only(top: 16.r),
              child: heading(text: "Price")),
          Row(
            children: [
              Icon(Icons.currency_rupee, size: 32.r),
              heading(
                  text: "${controller.guideData?.price ?? 0}", fontSize: 32.r),
              Text(
                "/person",
                style: TextStyle(
                    fontFamily: TypographyResources.roboto,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorsResources.textGreyColor),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.r),
            child: heading(text: "Duration"),
          ),
          Text("Per Hour"),
          Padding(
            padding: EdgeInsets.only(top: 32.r),
            child: customButton(
                onPressed: () {}, text: "Book Now", width: Get.width),
          )
        ],
      ),
    );
  }
}
