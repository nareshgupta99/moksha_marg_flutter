 import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget skelton(
      {required double width,
      required double height,
      double borderRadius = 0}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
    );
  }