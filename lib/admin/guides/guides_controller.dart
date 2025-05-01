import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:moksha_marg/admin/guides/guide_repository.dart';
import 'package:moksha_marg/admin/guides/guides_dataservice.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/network/network_resources.dart';
import 'package:moksha_marg/network/response/guide_data.dart';
import 'package:moksha_marg/network/response/language_data.dart';
import 'package:moksha_marg/network/response/restaurant_data.dart';
import 'package:moksha_marg/util/extensions.dart';

class GuidesController extends GetxController implements GetxService {
  final GuideRepository repository;
  GuidesController({required this.repository});

  String fileName = "";
  PlatformFile? Singlefile = null;
  late MultipartFiles multipartFile;

  var contactNumberController = TextEditingController();
  var priceController = TextEditingController();
  String openingTime = "";
  String clossingTime = "";
  List<String> foodTypes = List.empty(growable: true);
  bool restaurentFoodTypeChecked = false;
  GuideData? guideData;
  List<GuideData> guides = [];
  bool loading = false;
  List<String> languages = ["select language"];
  List<LanguageData> languagesData = [];

  List<String> selectedLanguage = [];

  List<LanguageData> selectedLanguageData = [];

  void SelectLanguage(String value) {
    if (selectedLanguage.contains(value)) {
      return;
    } else if (value == "select language") {
      return;
    }
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
    guideData = null;
    contactNumberController = TextEditingController();
    priceController = TextEditingController();
    restaurentFoodTypeChecked = false;
  }

  void registerWithValidation({required BuildContext context}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (contactNumberController.text.trim().isEmpty) {
      Get.snackbar("Error", "Contact Number is Required");
    } else if (!contactNumberController.text.trim().isValidPhone()) {
      Get.snackbar("Error", "Contact Number is Not Valid");
    } else if (priceController.text.trim().isEmpty) {
      Get.snackbar("Error", "Price is Required");
    } else if (!priceController.text.trim().isValidPrice()) {
      Get.snackbar("Error", "Price  is Not Valid");
    } else if (selectedLanguage.isEmpty) {
      Get.snackbar("Error", "At Least One Language is Required");
    } else if (Get.find<FilePickerController>().fileName.trim().isEmpty) {
      Get.snackbar("Error", "Image is Required");
    } else {
      context.loaderOverlay.show();
      createGuide(context: context);
    }
  }

  void getAllGuides() {
    // getAllGuidesData();
  }

  void getRestaurantById({required String id}) {
    // getRestaurantDataById(id: id);
  }

  void setRestaurantFoodType({required String foodType, required bool value}) {
    if (!foodTypes.contains(foodType)) foodTypes.add(foodType);
    restaurentFoodTypeChecked = !value;
    update();
  }

  void getAllLanguages() {
    getAllLanguage();
  }
}
