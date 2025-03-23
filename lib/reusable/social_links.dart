import 'package:flutter/material.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/images.dart';

Widget socialLogin() {
  return Row(
    spacing: 8,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
            border: Border.all(
                width: 3, color: ColorsResources.textFieldBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(Images.google, width: 50, fit: BoxFit.fill)),
      ),
      Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(
                width: 3, color: ColorsResources.textFieldBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            Images.facebook,
            // fit: BoxFit.fill,
            width: 20,
          ),
        ),
      ),
    ],
  );
}
