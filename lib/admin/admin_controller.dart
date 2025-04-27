import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:moksha_marg/admin/admin_repository.dart';
import 'package:moksha_marg/file_picker_controller.dart';
import 'package:moksha_marg/network/network_resources.dart';

class AdminController extends GetxController implements GetxService {
  final AdminRepository repository;
  AdminController({required this.repository});

  String fileName = "";
  PlatformFile? Singlefile = null;
  late MultipartFiles multipartFile;
  bool loading = false;

  void init() {
    fileName = "";
    Singlefile = null;
  }

  void addBannerWithValidation({required BuildContext context}) async {
    if (Get.find<FilePickerController>().fileName.trim().isEmpty) {
      Get.snackbar("Error", "Image is Required");
    } else {
      context.loaderOverlay.show();
      // registerRestaurant();
    }
  }

  void getAllBanner() {}

  void DeleteBannerById({required String id}) {}
}
