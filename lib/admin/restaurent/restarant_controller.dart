import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RestarantController extends GetxController implements GetxService {
  // final  repository;

  RestarantController();
  String fileName = "";
  FilePickerResult? result = null;
  var restaurentNameController = TextEditingController();
  var addressController = TextEditingController();
  var openingTimeController = TextEditingController();
  var closingTimeController = TextEditingController();
  var startingPriceController = TextEditingController();
  // var startingPriceController = TextEditingController();


  void init() {
    String fileName = "";
    FilePickerResult? result = null;
  }

  // Future<void> pickImage() async {
  //   result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['jpg', 'png', 'jpeg'],
  //   );

  //   if (result != null) {
  //     fileName = result?.files.single.name??"";
  //     update();
  //   }
  // }

}
