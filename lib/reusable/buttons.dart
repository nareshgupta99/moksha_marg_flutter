import 'package:flutter/material.dart';

Widget CustomButton({required VoidCallback onPressed,double? horizontal,double? verticle,required String text}) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal:horizontal?? 0, vertical:verticle?? 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    onPressed: onPressed,
    child: Text(text),
  );
}
