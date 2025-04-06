import 'package:flutter/material.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/custom_file_uploader.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/util/dimensions.dart';

class UpdateDish extends StatelessWidget {
  String id;
   UpdateDish({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigaton(isLeading: false),
      bottomNavigationBar: bottomNavigaton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.padding16, vertical: Dimensions.padding16),
          child: Column(
            children: [
              customTextField(
                  textFieldLabel: "Dish Name",
                  controller: TextEditingController()),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.padding16),
                  child: customTextField(
                      textFieldLabel: "Price",
                      controller: TextEditingController())),
              customTextField(
                  textFieldLabel: "Short Description",
                  controller: TextEditingController(),
                  maxLength: 150,
                  maxLine: 2),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.padding16),
                  child: customTextField(
                      textFieldLabel: "Description",
                      controller: TextEditingController(),
                      maxLine: 4,
                      maxLength: 300)),
              ImageUploadCard(),
              customButton(onPressed: () {}, text: "Add Dish")
            ],
          ),
        ),
      ),
    );
  }
}
