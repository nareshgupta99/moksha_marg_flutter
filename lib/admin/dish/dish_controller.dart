import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/dish/dish_dataservice.dart';
import 'package:moksha_marg/admin/dish/dish_repository.dart';
import 'package:moksha_marg/network/network_resources.dart';
import 'package:moksha_marg/network/response/add_dish.dart';
import 'package:moksha_marg/util/food_type_enum.dart';

class DishController extends GetxController implements GetxService {
  final DishRepository repository;
  DishController({required this.repository});
  String fileName = "";
  PlatformFile? Singlefile = null;
  late MultipartFiles multipartFile;
  String selecedFoodTypes = "";
  List<DishData> dishList = [];
  DishData? dish = null;

  var addDishNameController = TextEditingController();
  var priceControllerController = TextEditingController();
  var shortDescriptionController = TextEditingController();
  var descriptionController = TextEditingController();

  String foodTypes = "";

  List<String> foodTypesList = [
    "SELECT TYPE",
    FoodTypeEnum.VEG.name,
    FoodTypeEnum.NON_VEG.name,
  ];

  void init() {}

  void setSelectedRole({String? value}) {
    selecedFoodTypes = value ?? foodTypesList[2];
    print(selecedFoodTypes);
    update();
  }

  void addDish() {
    createDish();
  }
}
