import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/app/profile/profile_controller.dart';
import 'package:moksha_marg/app/profile/setting_model.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/util/alert.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/images.dart';
import 'package:moksha_marg/util/local_keys.dart';
import 'package:moksha_marg/util/local_storage.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    Get.find<ProfileController>().init();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
          appBar: topNavigaton(isLeading: false),
          bottomNavigationBar: bottomNavigaton(),
          backgroundColor: ColorsResources.backgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.padding16,
                vertical: Dimensions.padding16),
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
                          itemCount: controller.userSettingItems.length,
                          shrinkWrap: true,
                          itemBuilder: (element, index) {
                            return GestureDetector(
                              onTap: ()=>onTap(index),
                              child: _settingCardItem(
                                name: controller.userSettingItems[index].name,
                                icon: controller.userSettingItems[index].icon,
                              ),
                            );
                          })
                    ],
                  )),
            ),
          ));
    });
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

  Widget _settingCardItem({
    required String name,
    required IconData icon,
  }) {
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

  void logout(BuildContext context) async {
    String? loginData = await LocalStorage.getStringData(key: Keys.authData);
    String? guestData = await LocalStorage.getStringData(key: Keys.guestUuid);
    if (loginData != null || guestData != null) {
      showLogoutDialog(
          context, () => Get.find<ProfileController>().deleteAuth());
    }
  }

  void onTap(int index) {
    switch (index) {
      case 0:
        // Get.toNamed(RoutesHelper.());
        break;
      case 1:
        // changeLanguageView(context: context);
        break;
      case 2:
        // logout(context);
        break;
      case 3:
        logout(context);
        break;
    }
  }
}
