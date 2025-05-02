import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/guides/guides_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/star_rating.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/network_image.dart';

class GuidesView extends StatefulWidget {
  const GuidesView({super.key});

  @override
  State<GuidesView> createState() => _GuidesViewState();
}

class _GuidesViewState extends State<GuidesView> {
  @override
  void initState() {
    super.initState();
    Get.find<GuidesController>().getAllGuides();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuidesController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: topNavigaton(text: "Tourist Guides", isLeading: true),
        backgroundColor: ColorsResources.backgroundColor,
        body: _body(controller),
        bottomNavigationBar: bottomNavigaton(),
      );
    });
  }

  Widget _body(GuidesController controller) {
    print(controller.guides.length);
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.padding16,
                vertical: Dimensions.padding16),
            child: searchBar(text: "Search Guides....")),
        Expanded(
          child: ListView.builder(
            itemCount: controller.guides.length,
            itemBuilder: (context, index) {
              String language = "";
              controller.guides[index].languages?.forEach((lang) {
                language = language + " " + lang.languageName!;
              });
              return _guidesCard(
                id: controller.guides[index].guideId ?? "",
                  url: controller.guides[index].imageUrl ?? "",
                  name: controller.guides[index].name ?? "",
                  shortDiscription:
                      controller.guides[index].shortDiscription ?? "",
                  languages: language);
            },
          ),
        )
      ],
    );
  }

  Widget _guidesCard(
      {required String url,
      required String name,
      required String shortDiscription,
      required String languages,
      required String id}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding16, vertical: Dimensions.padding16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        height: (Get.height) / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              // child: Image.asset(
              //   url,
              //   height: Get.width / 2,
              //   fit: BoxFit.fill,
              // ),
              child: cachedImage(
                url: url,
                height: Get.width / 2,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.padding16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Dimensions.padding16),
                      child: heading(text: name, fontSize: 18.r)),
                  // Text("Explore the city's hidden gems with local expert")
                  Text(shortDiscription),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.padding16),
                    child: Row(
                      children: [
                        heading(text: "Languages: ", fontSize: 18.r),
                        Text(languages),
                      ],
                    ),
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
                  TextButton(
                      onPressed: () {
                        Get.toNamed(RoutesHelper.getGuidesDetails(guideId:id));
                      },
                      child: Row(
                        children: [
                          Text("View Guide"),
                          Icon(Icons.arrow_forward)
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
