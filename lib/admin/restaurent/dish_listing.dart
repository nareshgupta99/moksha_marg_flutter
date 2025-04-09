import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class DishListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Column(children: [
      heading(text: "Dish"),
      ListView.builder(itemBuilder: (element, index) {
        return _dishCard(
            url: Images.temple1, name: "Paneer Tikka", add: "", onTap: () {});
      })
    ]);
  }

  Widget _dishCard(
      {required String url,
      required String name,
      required String add,
      required VoidCallback onTap}) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(8)),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Image.asset(
              Images.temple1,
              width: Get.width,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: TypographyResources.roboto,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              add,
              style: TextStyle(
                  color: ColorsResources.greyColor,
                  fontFamily: TypographyResources.roboto,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 8,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.building_2_fill,
                    ),
                    Text(
                      "50+ hotels",
                      style: TextStyle(
                          fontFamily: TypographyResources.roboto,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                customButton(
                    onPressed: () {},
                    text: "View Details",
                    width: 20,
                    height: 12)
              ],
            ),
          )
        ],
      ),
    );
  }
}
