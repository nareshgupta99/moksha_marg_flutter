import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/admin/temple_dataservice.dart';
import 'package:moksha_marg/admin/temple_repository.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/network/network_resources.dart';
import 'package:moksha_marg/network/response/temple_data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TempleController extends GetxController implements GetxService {
  final TempleRepository repository;
  TempleController({required this.repository});

  String fileName = "";
  PlatformFile? Singlefile = null;
  late MultipartFiles multipartFile;

  var nameController = TextEditingController();
  var streetAddressController = TextEditingController();
  var cityController = TextEditingController();
  var linkController = TextEditingController();

  TempleData? templeData;
  List<TempleData> temples = [];

  void init() {
    fileName = "";
    Singlefile = null;
    nameController = TextEditingController();
    streetAddressController = TextEditingController();
    cityController = TextEditingController();
    linkController = TextEditingController();
  }

  void addTempleWithValidation() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (nameController.text.trim().isEmpty) {
      Get.snackbar("Error", "Temple Name is Required");
    } else if (streetAddressController.text.trim().isEmpty) {
      Get.snackbar("Error", "Temple Address is Required");
    } else if (cityController.text.trim().isEmpty) {
      Get.snackbar("Error", "city  is Required");
    } else if (linkController.text.trim().isEmpty) {
      Get.snackbar("Error", "Live link is Required");
    } else if (Get.find<FilePickerController>().fileName.trim().isEmpty) {
      Get.snackbar("Error", "Image is Required");
    } else {
      addTemple();
    }
  }

  void getAllTemple() {
    getAllTemples();
  }

  void getTempleById({required int id}) {
    getTempleById(id: id);
  }

  void deletTemple({required int id}) {
    deleteTempleById(id: id);
  }

  String? getYoutubeVideoId(String url) {
  return YoutubePlayer.convertUrlToId(url);
}
}
