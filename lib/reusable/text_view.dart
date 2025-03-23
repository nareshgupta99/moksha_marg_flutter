import 'package:flutter/material.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/typography_resources.dart';

Widget heading({required String text, double? fontSize}) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: TypographyResources.roboto,
        fontWeight: FontWeight.bold,
        fontSize: fontSize ?? 24),
  );
}

Widget socialFooter({required String text1,required String text2,required VoidCallback onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text1,style: TextStyle(
        color: ColorsResources.textGreyColor,
        fontFamily: TypographyResources.roboto
      ),),
      GestureDetector(
        onTap: onTap,
        child: Text(text2,style: TextStyle(
          fontFamily: TypographyResources.roboto
          
        ),),
      )
    ],
  );
}
