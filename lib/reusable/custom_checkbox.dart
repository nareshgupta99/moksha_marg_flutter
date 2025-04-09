import 'package:flutter/material.dart';
import 'package:moksha_marg/util/typography_resources.dart';

Widget customCheckBox(
    {required bool isChecked,
    required Function onChanged,
    required String label}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Checkbox(
          value: isChecked,
          onChanged: (value) {
            onChanged(value);
          }),
      Text(
        label,
        style: TextStyle(fontFamily: TypographyResources.roboto),
      )
    ],
  );
}
