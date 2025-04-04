
import 'package:flutter/widgets.dart';
import 'package:moksha_marg/util/dimensions.dart';

Widget label(
    {required String text,
    required Color backGroundColor,
    required Color textColor}) {
  return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.padding4, horizontal: Dimensions.padding12),
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
      child: Text(text, style: TextStyle(color: textColor)));
}
