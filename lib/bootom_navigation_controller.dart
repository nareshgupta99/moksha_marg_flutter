import 'package:get/get.dart';
import 'package:moksha_marg/helper/routes_helper.dart';

class BootomNavigationController extends GetxController implements GetxService {
  int selectedIndex = 0;

  List<String> _routes = [
    RoutesHelper.getHome(),
    RoutesHelper.getGuide(),
    RoutesHelper.getTemple(),
    RoutesHelper.getProfile(),
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
}
