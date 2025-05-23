import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/restaurent/restaurant_dataservice.dart';
import 'package:moksha_marg/admin/restaurent/restaurent_repository.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/network/network_resources.dart';
import 'package:moksha_marg/network/response/restaurant_data.dart';

class RestarantController extends GetxController implements GetxService {
  final RestaurentRepository repository;
  RestarantController({required this.repository});

  String fileName = "";
  PlatformFile? Singlefile = null;
  late MultipartFiles multipartFile;

  var restaurantNameController = TextEditingController();
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

  void init() {
    fileName = "";
    Singlefile = null;
    restaurantData = null;
    restaurantNameController = TextEditingController();
    addressController = TextEditingController();
    openingTimeController = TextEditingController();
    clossingTimeController = TextEditingController();
    //  openingTimeController = "";
    // clossingTimeController = "";
    startingPriceController = TextEditingController();
    restaurentFoodTypeChecked = false;
    // foodTypes = List.empty(growable: true);
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
    if (restaurantNameController.text.trim().isEmpty) {
      Get.snackbar("Error", "Restaurant Name is Required");
    } else if (addressController.text.trim().isEmpty) {
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
    } else {
      registerRestaurant();
    }
  }

  void getAllRestaurant() {
    getAllRestaurantData();
  }

  void getRestaurantById({required String id}) {
    getRestaurantDataById(id: id);
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
