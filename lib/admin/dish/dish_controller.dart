import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/dish/dish_dataservice.dart';
import 'package:moksha_marg/admin/dish/dish_repository.dart';
import 'package:moksha_marg/file_picker_controller.dart';
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
  DishData? dish;

  var addDishNameController = TextEditingController();
  var priceControllerController = TextEditingController();
  var shortDescriptionController = TextEditingController();
  var descriptionController = TextEditingController();

  var editDishNameController = TextEditingController();
  var editPriceController = TextEditingController();
  var editShortDescriptionController = TextEditingController();
  var editdescriptionController = TextEditingController();

  String foodTypes = "";

  List<String> foodTypesList = [
    "SELECT TYPE",
    FoodTypeEnum.VEG.name,
    FoodTypeEnum.NON_VEG.name,
  ];

  void init() {
    editDishNameController = TextEditingController();
    editPriceController = TextEditingController();
    editShortDescriptionController = TextEditingController();
    editdescriptionController = TextEditingController();
  }

  void editDishintilize({required DishData dish}) {
    editDishNameController.text = dish.dishName ?? "";
    editPriceController.text = "${dish.price}";
    editShortDescriptionController.text = dish.shortDescription ?? "";
    editdescriptionController.text = dish.description ?? "";
  }

  void setSelectedRole({String? value}) {
    selecedFoodTypes = value ?? foodTypesList[2];
    update();
  }

  void addDish() {
    createDish(1);
    Get.snackbar('Success', 'Dish Added');
  }

  void getAllDishByRestaurant({required int id}) {
    getAllDishDataByRestaurant(id: id);
  }

  void getDishById({required int id}) {
    getDishById(id: id);
  }

  void deleteDish({required int id}) {
    deleteDishById(id: id);
  }
}
