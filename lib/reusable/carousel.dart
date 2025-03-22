import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget customCarousel(
    {required double width,
    required double height,
    required List<String> images}) {
  return CarouselSlider(
    options: CarouselOptions(
      // autoPlay: true,
      height: height,
      viewportFraction: 1.0,
      // autoPlayInterval: Duration(seconds: 5),
      autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
    ),
    items: images.map((url) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: width,
              height: height,
              // padding: EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(
                url,
                height: height,
                width: width,
                fit: BoxFit.fill,
              ));
        },
      );
    }).toList(),
  );
}
