import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/restaurent/restarant_controller.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/custom_checkbox.dart';
import 'package:moksha_marg/reusable/custom_file_uploader.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/util/dimensions.dart';

class GuidesRegisterView extends StatefulWidget {
  const GuidesRegisterView({super.key});

  @override
  State<GuidesRegisterView> createState() => _GuidesRegisterViewState();
}

class _GuidesRegisterViewState extends State<GuidesRegisterView> {
  @override
  void initState() {
    super.initState();
    Get.find<RestarantController>().init();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestarantController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: topNavigaton(isLeading: false),
        bottomNavigationBar: bottomNavigatonGuide(),
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
                  readOnly: true,
                  textFieldLabel: "Opening Time",
                  onClick: () => {controller.selectOpeningTime(context)},
                  controller: controller.openingTimeController,
                ),
                customTextField(
                  readOnly: true,
                  textFieldLabel: "Closing Time",
                  onClick: () => controller.selectClosingTime(context),
                  controller: controller.clossingTimeController,
                ),
                customTextField(
                    textFieldLabel: "Price",
                    controller: controller.startingPriceController),
                customFileUpload(),
                customButton(
                    onPressed: () => controller.registerWithValidation(),
                    text: "Add Guides")
              ],
            ),
          ),
        ),
      );
    });
  }
}
