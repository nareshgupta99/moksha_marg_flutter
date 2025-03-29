import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/star_rating.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/images.dart';

class GuidesView extends StatelessWidget {
  const GuidesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigaton(text: "Tourist Guides", isLeading: true),
      backgroundColor: ColorsResources.backgroundColor,
      body: _body(),
      bottomNavigationBar: bottomNavigaton(1),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
            child: searchBar(text: "Search Guides....")),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => RoutesHelper.getGuidesDetails(),
                  child: _guidesCard(url: Images.temple2, text: ""));
            },
          ),
        )
      ],
    );
  }

  Widget _guidesCard({required String url, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
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
                child: Image.asset(
                  url,
                  height: Get.width / 2,
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: heading(text: "Tomb", fontSize: 18)),
                  Text("Explore the city's hidden gems with local expert"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        heading(text: "Languages: ", fontSize: 18),
                        Text("English, Hindi ,Sanskrit"),
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
                      onPressed: () {},
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
