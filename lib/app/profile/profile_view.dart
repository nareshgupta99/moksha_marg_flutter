import 'package:flutter/material.dart';
import 'package:moksha_marg/app/profile/setting_model.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topNavigaton(isLeading: false),
        bottomNavigationBar: bottomNavigaton(),
        backgroundColor: ColorsResources.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.padding16, vertical: Dimensions.padding16),
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.padding16,
                    vertical: Dimensions.padding16),
                child: Column(
                  children: [
                    _header(),
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.padding32),
                      child: heading(text: "Settings")),
                    ListView.builder(
                        itemCount: settingData.length,
                        shrinkWrap: true,
                        itemBuilder: (element, index) {
                          return _settingCardItem(
                              name: settingData[index].name,
                              icon: settingData[index].icon,
                              onTap: () {});
                        })
                  ],
                )),
          ),
        ));
  }
}

Widget _header() {
  return Row(
    children: [
      CircleAvatar(
        backgroundImage: AssetImage(Images.temple1),
        radius: 50,
      ),
      Padding(
        padding: EdgeInsets.only(left: Dimensions.padding16),
        child: Column(
          children: [
            heading(text: "John Doe"),
            Text(
              "Member since 2023",
              style: TextStyle(color: ColorsResources.textGreyColor),
            ),
            customButton(onPressed: () {}, text: "Edit Profile", width: 120),
          ],
        ),
      )
    ],
  );
}

Widget _settingCardItem(
    {required String name,
    required IconData icon,
    required VoidCallback onTap}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: Dimensions.padding16, vertical: Dimensions.padding16),
    child: Container(
      color: ColorsResources.greyColor.withOpacity(0.2),
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding16, vertical: Dimensions.padding16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontFamily: TypographyResources.roboto),
          ),
          Icon(icon)
        ],
      ),
    ),
  );
}
