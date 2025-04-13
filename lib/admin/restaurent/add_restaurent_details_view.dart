import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/restaurent/restarant_controller.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/custom_checkbox.dart';
import 'package:moksha_marg/reusable/custom_file_uploader.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/util/dimensions.dart';

class AddRestaurentDetailsView extends StatefulWidget {
  const AddRestaurentDetailsView({super.key});

  @override
  State<AddRestaurentDetailsView> createState() => _AddRestaurentDetailsState();
}

class _AddRestaurentDetailsState extends State<AddRestaurentDetailsView> {
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
                    textFieldLabel: "Restaurent Name",
                    controller: controller.restaurantNameController),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.padding16),
                    child: customTextField(
                        textFieldLabel: "Address",
                        controller: controller.addressController)),
                customTextField(
                    textFieldLabel: "Opening Time",
                    controller:controller.openingTimeController),
                customTextField(
                    textFieldLabel: "Closing Time",
                    controller: controller.clossingTimeController),
                customTextField(
                    textFieldLabel: "Starting Price",
                    controller: controller.startingPriceController),
                Row(
                  children: [
                    customCheckBox(
                        isChecked: controller.restaurentFoodTypeChecked, onChanged: (v)=>controller.setRestaurantFoodType(value: v, foodType: "VEG"), label: "Veg")
                  ],
                ),
                customFileUpload(),
                customButton(onPressed: () =>controller.registerWithValidation(), text: "Add Dish")
              ],
            ),
          ),
        ),
      );
    });
  }
}
