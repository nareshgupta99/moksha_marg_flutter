import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/temple_controller.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/custom_file_uploader.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/util/dimensions.dart';

class AddTempleView extends StatefulWidget {
  const AddTempleView({super.key});

  @override
  State<AddTempleView> createState() => _AddTempleState();
}

class _AddTempleState extends State<AddTempleView> {
  @override
  void initState() {
    super.initState();
    Get.find<TempleController>().init();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TempleController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: topNavigaton(isLeading: false),
        bottomNavigationBar: bottomNavigatonAdmin(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.padding16,
                vertical: Dimensions.padding16),
            child: Column(
              children: [
                customTextField(
                    textFieldLabel: "Temple Name",
                    controller: controller.nameController),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.padding16),
                    child: customTextField(
                        textFieldLabel: "city",
                        controller: controller.cityController)),
                customTextField(
                    textFieldLabel: "Street Address",
                    controller: controller.streetAddressController),
                customTextField(
                    textFieldLabel: "Live Link",
                    controller: controller.linkController),
                customFileUpload(),
                customButton(
                    onPressed: () => controller.addTempleWithValidation(),
                    text: "Add Temple")
              ],
            ),
          ),
        ),
      );
    });
  }
}
