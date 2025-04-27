import 'package:get/get.dart';
import 'package:moksha_marg/helper/routes_helper.dart';

class BootomNavigationController extends GetxController implements GetxService {
  int selectedIndex = 0;

  List<String> visitorAdminRoutesName = ["Home", "Guides", "Live", "Profile"];

  List<String> restaurentOwnerRoutesName = [
    "Update",
    "Dish",
    "Add Dish",
    "Profile"
  ];

  List<String> _routes = [
    RoutesHelper.getHome(),
    RoutesHelper.getGuide(),
    RoutesHelper.getTemple(),
    RoutesHelper.getProfile(),
  ];

  final List<String> _routesRestaurentOwner = [
    RoutesHelper.getDishListing(),
    RoutesHelper.getAddDish(),
    RoutesHelper.getAddDish(),
    RoutesHelper.getRestaurentProfile(),
  ];

   final List<String> _admin = [
    RoutesHelper.getTempleListing(),
    RoutesHelper.getTempleListing(),
    RoutesHelper.getAddTemple(),
    RoutesHelper.getAdminProfile(),
  ];

  final List<String> _guides = [
    RoutesHelper.getAddGuide(),
    RoutesHelper.getGuideProfile(),
    RoutesHelper.getGuideProfile(),
    RoutesHelper.getGuideProfile(),
  ];

  void init() {
    // selectedIndex = 0;
    _routes = [
      RoutesHelper.getHome(),
      RoutesHelper.getGuide(),
      RoutesHelper.getTemple(),
      RoutesHelper.getProfile(),
    ];
  }

  void setSelectedIndex(int index) {
    selectedIndex = index;
    Get.offNamed(_routes[index]);
    update();
  }

  void setRestaurentSelectedIndex(int index) {
    selectedIndex = index;
    Get.offNamed(_routesRestaurentOwner[index]);
    update();
  }

  void setAdminIndex(int index){
    selectedIndex = index;
    Get.offNamed(_admin[index]);
    update();
  }
}
