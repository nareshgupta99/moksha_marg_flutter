import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/guides/guides_controller.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/custom_file_uploader.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';
import 'package:moksha_marg/util/colors_resources.dart';
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
    Get.find<GuidesController>().init();
    Get.find<GuidesController>().getAllLanguages();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuidesController>(builder: (controller) {
      return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: topNavigaton(isLeading: false),
        bottomNavigationBar: bottomNavigatonGuide(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.padding16,
                vertical: Dimensions.padding16),
            child: Column(
              children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.padding16),
                    child: customTextField(
                        textFieldLabel: "Contact Number",
                        controller: controller.contactNumberController)),
                customDropDown(
                    items: controller.languages,
                    onChanged: (newValue) {
                      controller.SelectLanguage(newValue);
                    },
                    selected: controller.languages[0],
                    textFieldLabel: 'Select Language'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.r),
                  child: Container(
                    height: 80.r,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: ColorsResources.textFieldBorderColor,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: ListView.builder(
                        itemCount: controller.selectedLanguage.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.r, vertical: 6.r),
                              child: GestureDetector(
                                onTap: () => controller.removeSelected(
                                    controller.selectedLanguage[index]),
                                child: Text(
                                    "${controller.selectedLanguage[index]} ✖️"),
                              ));
                        }),
                  ),
                ),
                customTextField(
                    textFieldLabel: "Price / Hour",
                    controller: controller.priceController),
                Padding(
                    padding: EdgeInsets.only(top: 16.r),
                    child: customFileUpload()),
                customButton(
                    onPressed: () => controller.registerWithValidation(context: context),
                    text: "Add Guides")
              ],
            ),
          ),
        ),
      );
    });
  }
}
