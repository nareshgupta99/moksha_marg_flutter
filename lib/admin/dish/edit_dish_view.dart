import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/dish/dish_controller.dart';
import 'package:moksha_marg/network/response/add_dish.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/custom_file_uploader.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/util/dimensions.dart';

class EditDishView extends StatefulWidget {
  DishData dish;
  EditDishView({super.key, required this.dish});

  @override
  State<EditDishView> createState() => _EditDishState();
}

class _EditDishState extends State<EditDishView> {
  @override
  void initState() {
    super.initState();
    Get.find<DishController>().init();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DishController>(builder: (controller) {
      controller.editDishintilize(dish: widget.dish);
      return Scaffold(
        appBar: topNavigaton(isLeading: false),
        bottomNavigationBar: bottomNavigatonRestaurent(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.padding16,
                vertical: Dimensions.padding16),
            child: Column(
              children: [
                customTextField(
                    textFieldLabel: "Dish Name",
                    controller: controller.editDishNameController),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.padding16),
                    child: customTextField(
                        textFieldLabel: "Price",
                        controller: controller.editPriceController)),
                customTextField(
                    textFieldLabel: "Short Description",
                    controller: controller.editShortDescriptionController,
                    maxLength: 150,
                    maxLine: 2),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.padding16),
                    child: customTextField(
                        textFieldLabel: "Description",
                        controller: controller.editdescriptionController,
                        maxLine: 4,
                        maxLength: 300)),
                customDropDown(
                    items: controller.foodTypesList,
                    onChanged: (newValue) {
                      controller.setSelectedRole(value: newValue);
                    },
                    selected: controller.foodTypesList
                            .contains(controller.selecedFoodTypes)
                        ? controller.selecedFoodTypes
                        : null,
                    textFieldLabel: "Select Type"),
                // customFileUpload(),
                customButton(
                    onPressed: () => controller.addDish(), text: "Add Dish")
              ],
            ),
          ),
        ),
      );
    });
  }
}
