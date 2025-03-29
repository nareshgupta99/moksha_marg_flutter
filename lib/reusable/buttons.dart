import 'package:flutter/material.dart';
import 'package:moksha_marg/util/colors_resources.dart';

Widget customButton(
    {required VoidCallback onPressed,
    double? height,
    double? width,
    required String text}) {
  return Container(
    width: width,
    height: height,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        // padding: EdgeInsets.symmetric(horizontal:horizontal?? 0, vertical:verticle?? 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    ),
  );
}

Widget circularButton({required VoidCallback onPressed,required IconData iconData}) {
  return CircleAvatar(
    radius: 20,
    backgroundColor: ColorsResources.greyColor, 
    child: IconButton(
      icon:  Icon(
        iconData,
        color: Colors.black, // Icon color
        size: 20, // Icon size
      ),
      onPressed:onPressed
      
    ),
  );
}
