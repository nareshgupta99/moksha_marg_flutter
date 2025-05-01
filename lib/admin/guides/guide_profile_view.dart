import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/app/profile/profile_controller.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/reusable/buttons.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_view.dart';
import 'package:moksha_marg/shimer/profile_shimmer.dart';
import 'package:moksha_marg/util/alert.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/local_keys.dart';
import 'package:moksha_marg/util/local_storage.dart';
import 'package:moksha_marg/util/typography_resources.dart';

class GuideProfileView extends StatefulWidget {
  const GuideProfileView({super.key});

  @override
  State<GuideProfileView> createState() => _GuideProfileViewState();
}

class _GuideProfileViewState extends State<GuideProfileView> {
  @override
  void initState() {
    super.initState();
    Get.find<ProfileController>().init();
    Get.find<ProfileController>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return (controller.loading) ? ProfileShimmer() : Scaffold(
          appBar: topNavigaton(isLeading: false),
          bottomNavigationBar: bottomNavigatonGuide(),
          backgroundColor: ColorsResources.backgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.padding16,
                vertical: Dimensions.padding16),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(8.r)),
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
                      Expanded(
                        child: ListView.builder(
                            itemCount: controller.guideSettingItems.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => onTap(index),
                                child: _settingCardItem(
                                  name: controller
                                      .guideSettingItems[index].name,
                                  icon: controller
                                      .guideSettingItems[index].icon,
                                ),
                              );
                            }),
                      )
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
              backgroundImage:
                  CachedNetworkImageProvider(controller.user?.image ?? ""),
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
                  onTap: () => controller.updateImage(context: context),
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
    String? guestData = await LocalStorage.getStringData(key: Keys.guestUuid);
    if (loginData != null || guestData != null) {
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
        Get.toNamed(RoutesHelper.getFoodCart());
        break;
      case 2:
        logout(context);
        break;
    }
  }
}
