import 'package:get/get.dart';

class BootomNavigationController extends GetxController implements GetxService {
  int selectedIndex = 0;

  void init() {
    selectedIndex = 0;
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }

}
