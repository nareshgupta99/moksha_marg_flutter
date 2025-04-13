import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/restaurent/restarant_controller.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/custom_file_uploader.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/util/dimensions.dart';

class AddDish extends StatefulWidget {
  @override
  State<AddDish> createState() => _AddDishState();
}

class _AddDishState extends State<AddDish> {
  @override
  void initState() {
    super.initState();
    Get.find<RestarantController>().init();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestarantController>(builder: (controller) {
      return Scaffold(
        appBar: topNavigaton(isLeading: false),
        bottomNavigationBar: bottomNavigaton(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.padding16,
                vertical: Dimensions.padding16),
            child: Column(
              children: [
                customTextField(
                    textFieldLabel: "Dish Name",
                    controller: TextEditingController()),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.padding16),
                    child: customTextField(
                        textFieldLabel: "Price",
                        controller: TextEditingController())),
                customTextField(
                    textFieldLabel: "Short Description",
                    controller: TextEditingController(),
                    maxLength: 150,
                    maxLine: 2),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.padding16),
                    child: customTextField(
                        textFieldLabel: "Description",
                        controller: TextEditingController(),
                        maxLine: 4,
                        maxLength: 300)),
                // ImageUploadCard(),
                customFileUpload(),
                customButton(onPressed: ()=> controller.registerWithValidation() , text: "Add Dish")
              ],
            ),
          ),
        ),
      );
    });
  }
}
