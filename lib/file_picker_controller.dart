import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FilePickerController extends GetxController implements GetxService {
  

 String fileName = "";
  FilePickerResult? result = null;

  void init() {
    String fileName = "";
    FilePickerResult? result = null;
  }

  Future<void> pickImage() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      fileName = result?.files.single.name??"";
      update();
    }
  }



}
