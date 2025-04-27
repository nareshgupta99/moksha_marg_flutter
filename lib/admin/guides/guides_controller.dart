import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/guides/guide_repository.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/network/network_resources.dart';
import 'package:moksha_marg/network/response/language_data.dart';
import 'package:moksha_marg/network/response/restaurant_data.dart';

class GuidesController extends GetxController implements GetxService {
  final GuideRepository repository;
  GuidesController({required this.repository});

  String fileName = "";
  PlatformFile? Singlefile = null;
  late MultipartFiles multipartFile;

  var addressController = TextEditingController();
  var openingTimeController = TextEditingController();
  var clossingTimeController = TextEditingController();
  var startingPriceController = TextEditingController();
  String openingTime = "";
  String clossingTime = "";
  List<String> foodTypes = List.empty(growable: true);
  bool restaurentFoodTypeChecked = false;
  RestaurantData? restaurantData = null;
  List<RestaurantData> restaurants = [];
  bool loading = false;
  List<String> languages = ["select language", "English", "Hindi", "Chinese"];

  List<String> selectedLanguage = [];

  void SelectLanguage(String value) {
    selectedLanguage.add(value);
    update();
  }

  void removeSelected(String value) {
    selectedLanguage.removeWhere((item) => item == value);
    update();
  }

  void init() {
    fileName = "";
    Singlefile = null;
    restaurantData = null;
    addressController = TextEditingController();
    openingTimeController = TextEditingController();
    clossingTimeController = TextEditingController();

    startingPriceController = TextEditingController();
    restaurentFoodTypeChecked = false;
    foodTypes.add("VEG");
  }

  void initRestaurantData() {
    restaurants = [];
  }

  void initRestaurentDetails({required String restaurantId}) {
    print("restaurent id:: $restaurantId");
  }

  void registerWithValidation() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (addressController.text.trim().isEmpty) {
      Get.snackbar("Error", "Restaurant Address is Required");
    } else if (openingTimeController.text.trim().isEmpty) {
      Get.snackbar("Error", "openingTime  is Required");
    } else if (clossingTimeController.text.trim().isEmpty) {
      Get.snackbar("Error", "clossingTime is Required");
    } else if (startingPriceController.text.trim().isEmpty) {
      Get.snackbar("Error", "Starting price  is Required");
    } else if (foodTypes.isEmpty) {
      Get.snackbar("Error", "food Type is Required");
    } else if (Get.find<FilePickerController>().fileName.trim().isEmpty) {
      Get.snackbar("Error", "Image is Required");
    } else {}
  }

  void getAllRestaurant() {
    // getAllRestaurantData();
  }

  void getRestaurantById({required String id}) {
    // getRestaurantDataById(id: id);
  }

  void setRestaurantFoodType({required String foodType, required bool value}) {
    if (!foodTypes.contains(foodType)) foodTypes.add(foodType);
    restaurentFoodTypeChecked = !value;
    update();
  }

  void selectOpeningTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      final hour = pickedTime.hourOfPeriod == 0 ? 12 : pickedTime.hourOfPeriod;
      final minute = pickedTime.minute.toString().padLeft(2, '0');
      final period = pickedTime.period == DayPeriod.am ? "AM" : "PM";

      openingTime = "$hour:$minute $period"; // 📅 12-hour time with AM/PM
      print("Openning time :: $openingTime");
      openingTimeController.text = openingTime;
      update();
    }
  }

  void selectClosingTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      final hour = pickedTime.hourOfPeriod == 0 ? 12 : pickedTime.hourOfPeriod;
      final minute = pickedTime.minute.toString().padLeft(2, '0');
      final period = pickedTime.period == DayPeriod.am ? "AM" : "PM";

      clossingTime = "$hour:$minute $period"; // 📅 12-hour time with AM/PM
      print("closing time :: $clossingTime");
      clossingTimeController.text = clossingTime;
      update();
    }
  }
}
