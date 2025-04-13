import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/network/network_resources.dart';

class FilePickerController extends GetxController implements GetxService {
  String fileName = "";
  
  List<MultipartFiles> multipartFiles = [];

  void init() {
     fileName = "";
  }

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      fileName = result.files.single.name;
      final pickedFile = File(result.files.single.path!);
      multipartFiles.add(MultipartFiles("image", pickedFile));
      update();
    }
  }
}
