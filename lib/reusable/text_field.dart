import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/typography_resources.dart';

Widget customTextField(
    {String? hintText,
    int? maxLine,
    int? maxLength,
    required String textFieldLabel,
    required TextEditingController controller,
    Widget? prefix}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(textFieldLabel,
          style: TextStyle(
              fontFamily: TypographyResources.roboto,
              fontSize: 16,
              fontWeight: FontWeight.w700)),
      TextField(
        autocorrect: false,
        controller: controller,
        inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
        maxLines: maxLine ?? 1,
        decoration: InputDecoration(
            hintText: hintText ?? "",
            hintStyle: TextStyle(fontFamily: TypographyResources.roboto, color: ColorsResources.textGreyColor),
            prefixIcon: prefix,
            contentPadding: const EdgeInsets.only(bottom: 3, left: 7),
            fillColor: ColorsResources.textFillColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: ColorsResources.textFieldBorderColor, width: 3)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: ColorsResources.textFieldBorderColor, width: 3))),
      ),
    ],
  );
}

Widget customObsecureTextField(
    {String? hintText,
    VoidCallback? onTap,
    int? maxLine,
    int? maxLength,
    required String textFieldLabel,
    required TextEditingController controller,
    bool isObsecure = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(textFieldLabel,
          style: TextStyle(
              fontFamily: TypographyResources.roboto,
              fontSize: 16,
              fontWeight: FontWeight.w700)),
      TextField(
        autocorrect: false,
        controller: controller,
        inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
        maxLines: maxLine ?? 1,
        obscureText: isObsecure,
        decoration: InputDecoration(
            hintText: hintText ?? "",
            hintStyle: TextStyle(fontFamily: TypographyResources.roboto,color: ColorsResources.textGreyColor ),
            suffixIcon: GestureDetector(
                onTap: onTap,
                child: Icon(isObsecure
                    ? CupertinoIcons.eye_slash
                    : CupertinoIcons.eye)),
            contentPadding: const EdgeInsets.only(bottom: 3, left: 7),
            fillColor: ColorsResources.textFillColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: ColorsResources.textFieldBorderColor, width: 3)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: ColorsResources.textFieldBorderColor, width: 3))),
      ),
    ],
  );
}

Widget customDropDown(
    {required List<String> items,
    required ValueChanged onChanged,
    required String selected,
    required String textFieldLabel}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        textFieldLabel,
        style: TextStyle(
            fontFamily: TypographyResources.roboto,
            fontSize: 16,
            fontWeight: FontWeight.w700),
      ),
      Container(
        decoration: BoxDecoration(
            color: ColorsResources.textFillColor,
            border: Border.all(
              color: ColorsResources.textFieldBorderColor,
              width: 3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selected, // Currently selected value
            onChanged: onChanged,
            isExpanded: true,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 7),
            style: TextStyle(
              fontFamily: TypographyResources.roboto,
              color: Colors.black,
            ),
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      )
    ],
  );
}
