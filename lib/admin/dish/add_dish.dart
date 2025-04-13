import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/dish/dish_controller.dart';
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
    Get.find<DishController>().init();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DishController>(builder: (controller) {
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
                    controller: controller.addDishNameController),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.padding16),
                    child: customTextField(
                        textFieldLabel: "Price",
                        controller: controller.priceControllerController)),
                customTextField(
                    textFieldLabel: "Short Description",
                    controller:controller.shortDescriptionController,
                    maxLength: 150,
                    maxLine: 2),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.padding16),
                    child: customTextField(
                        textFieldLabel: "Description",
                        controller:controller.descriptionController,
                        maxLine: 4,
                        maxLength: 300)),

                        customDropDown(
                  items: controller.foodTypesList,
                  onChanged: (newValue) {
                    controller.setSelectedRole(value: newValue);
                  },
                  selected: controller.foodTypesList.contains(controller.selecedFoodTypes)
                      ? controller.selecedFoodTypes
                      : null,
                  textFieldLabel: "Select Type"),
                customFileUpload(),
                customButton(onPressed: ()=> controller.addDish() , text: "Add Dish")
              ],
            ),
          ),
        ),
      );
    });
  }
}
