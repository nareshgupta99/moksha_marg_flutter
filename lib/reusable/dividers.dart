import 'package:flutter/material.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/typography_resources.dart';

Widget customDividersWithText({required String text}) {
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: TypographyResources.roboto,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: ColorsResources.textGreyColor,
          ),
        ),
      ),
      Expanded(
        child: Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ),
    ],
  );
}

Widget customDivider() {
  return Divider(
    color: Colors.grey,
    thickness: 1,
  );
}
