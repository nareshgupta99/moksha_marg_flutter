import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/app/profile/profile_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
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

class AdminProfileView extends StatefulWidget {
  const AdminProfileView({super.key});

  @override
  State<AdminProfileView> createState() => _AdminProfileViewState();
}

class _AdminProfileViewState extends State<AdminProfileView> {
  @override
  void initState() {
    super.initState();
    Get.find<ProfileController>().init();
    Get.find<ProfileController>().getProfile();

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
          appBar: topNavigaton(isLeading: false),
          bottomNavigationBar: bottomNavigatonAdmin(),
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
                      _header(controller),
                      Padding(
                          padding: EdgeInsets.only(top: Dimensions.padding32),
                          child: heading(text: "Settings")),
                      ListView.builder(
                          itemCount: controller.userSettingItems.length,
                          shrinkWrap: true,
                          itemBuilder: (element, index) {
                            return GestureDetector(
                              onTap: () => onTap(index),
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

  Widget _header(ProfileController controller) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(Images.temple1),
              radius: 60.r,
            ),
            Positioned(
              bottom: 3.r,
              left: 20.r,
              right: 20.r,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30.r),
                  ),
                ),
                alignment: Alignment.center,
                width: Get.width,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => () {},
                  child: Text(
                    'Update',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: Dimensions.padding16),
          child: Column(
            children: [
              heading(text: controller.user?.name ?? ""),
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
    String? bearer = await LocalStorage.getStringData(key: Keys.bearerToken);
    if (loginData != null || bearer != null) {
      showLogoutDialog(
          context, () => Get.find<ProfileController>().deleteAuth());
    }
  }

  void onTap(int index) {
    switch (index) {
      case 0:
        Get.toNamed(RoutesHelper.getChangedPassword());
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
