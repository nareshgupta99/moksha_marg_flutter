import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/custom_file_uploader.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/util/dimensions.dart';

class AddBanner extends StatefulWidget {
  const AddBanner({super.key});

  @override
  State<AddBanner> createState() => _AddBannerState();
}

class _AddBannerState extends State<AddBanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: topNavigaton(isLeading: false),
      bottomNavigationBar: bottomNavigatonAdmin(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: Dimensions.padding32),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Dimensions.padding16),
              child: customFileUpload())),
          customButton(onPressed: () {}, text: "Add Banner Image")
        ],
      ),
    );
  }
}
