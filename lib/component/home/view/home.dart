import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/carousel.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<String> images = [
    Images.temple1,
    Images.temple2,
    Images.temple3,
    Images.temple4,
    Images.temple5,
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: topNavigaton(),
        backgroundColor: const Color.fromARGB(255, 165, 173, 173),
        bottomNavigationBar: bottomNavigaton(0),
        body: SingleChildScrollView(
            child: Column(
          children: [
            customCarousel(width: width, height: height / 5, images: images),
            _body(context)
          ],
        )));
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // services section
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
                return _serviceCard(
                    url: images[index],
                    heading: "Food Ordering",
                    desc: "Satvik Meal");
              }),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text("Live Darshan Now",
                style: TextStyle(
                    fontFamily: TypographyResources.roboto,
                    fontWeight: FontWeight.w900,
                    fontSize: 24)),
          ),

          // List View
          SizedBox(
            height: 230,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _livedarhanCard();
                }),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Popular Destination ",
              style: TextStyle(
                  fontFamily: TypographyResources.roboto,
                  fontWeight: FontWeight.w900,
                  fontSize: 24),
            ),
          ),

          _destinationCard(
            url: images[0],
            name: "Tirupati Balaji",
            add: "Andhra Pradesh",
            onTap: () {},
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Nearby Food Service",
              style: TextStyle(
                  fontFamily: TypographyResources.roboto,
                  fontWeight: FontWeight.w900,
                  fontSize: 24),
            ),
          ),

          _foodServiceCard(
            url: images[0],
            type: "Pure Vegetarian",
            rating: 4.5,
            priceWithUnit: "200 for two",
            restaurentName: "Satvik Bhoj",
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _serviceCard(
      {required String url, required String heading, required String desc}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              url,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            heading,
            style: TextStyle(
                fontFamily: TypographyResources.roboto,
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
          Text(
            desc,
            style: TextStyle(
                color: ColorsResources.greyColor,
                fontFamily: TypographyResources.roboto,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  Widget _livedarhanCard() {
    return Container(
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      width: Get.width / 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Image.asset(
              images[0],
              width: Get.width / 1.5,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: Text(
              "Sidhivinayak Temple",
              style: TextStyle(
                  fontFamily: TypographyResources.roboto,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Mumbai, Maharastra",
              style: TextStyle(
                  color: ColorsResources.greyColor,
                  fontFamily: TypographyResources.roboto,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: Row(
              spacing: 8,
              children: [
                Icon(
                  CupertinoIcons.eye_fill,
                  color: ColorsResources.greyColor,
                ),
                Text(
                  "2.4k watching",
                  style: TextStyle(
                      color: ColorsResources.greyColor,
                      fontFamily: TypographyResources.roboto,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _destinationCard(
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
              images[0],
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
                
                CustomButton(  onPressed: () {}, text: "View Details",   horizontal: 20,   verticle: 12)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _foodServiceCard(
      {required String url,
      required restaurentName,
      required String type,
      required VoidCallback onPressed,
      required double rating,
      required String priceWithUnit}) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(8)),
      width: Get.width,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image.asset(
                url,
                width: 120,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Text(
                  restaurentName,
                  style: TextStyle(
                    fontFamily: TypographyResources.roboto,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  type,
                  style: TextStyle(
                    fontFamily: TypographyResources.roboto,
                    color: ColorsResources.greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star_purple500_sharp, color: Colors.yellow),
                    Text("$rating"),
                    Icon(Icons.currency_rupee_rounded),
                    Text(priceWithUnit)
                  ],
                )
              ],
            ),
           
            CustomButton(onPressed: (){}, text: "Order")
          ],
        ),
      ),
    );
  }
}
