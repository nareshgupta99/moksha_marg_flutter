import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/restaurent/restaurant_dataservice.dart';
import 'package:moksha_marg/admin/restaurent/restaurent_repository.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/network/network_resources.dart';
import 'package:moksha_marg/network/response/restaurant_data.dart';
import 'package:http/http.dart' as http;

class RestarantController extends GetxController implements GetxService {
  final RestaurentRepository repository;
  RestarantController({required this.repository});

  String fileName = "";
  PlatformFile? Singlefile = null;
 late MultipartFiles multipartFile ;

  var restaurantNameController = TextEditingController();
  var addressController = TextEditingController();
  var openingTimeController = TextEditingController();
  var clossingTimeController = TextEditingController();
  var startingPriceController = TextEditingController();
  List<String> foodTypes = List.empty(growable: true);
  bool restaurentFoodTypeChecked = false;
  late RestaurantData restaurantData;

  void init() {
    fileName = "";
    Singlefile = null;
    restaurantNameController = TextEditingController();
    addressController = TextEditingController();
    openingTimeController = TextEditingController();
    clossingTimeController = TextEditingController();
    startingPriceController = TextEditingController();
    restaurentFoodTypeChecked = false;
    // foodTypes = List.empty(growable: true);
    foodTypes.add("VEG");
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

  void setRestaurantFoodType({required String foodType, required bool value}) {
    print("restaurent $restaurentFoodTypeChecked");
    if (!foodTypes.contains(foodType)) foodTypes.add(foodType);
    restaurentFoodTypeChecked = !value;
    print("2 restaurent $restaurentFoodTypeChecked");
    update();
  }
}
