import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:moksha_marg/file_picker_controller.dart';

Widget customFileUpload() {
  return GetBuilder<FilePickerController>(builder: (controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Upload images",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: controller.pickImage,
          child: DottedBorder(
            color: Colors.grey,
            dashPattern: [6, 4],
            strokeWidth: 1,
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.image_outlined, size: 40, color: Colors.grey),
                  const SizedBox(height: 10),
                  Text(
                    controller.fileName ?? "Upload images",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "PNG, JPG up to 10MB",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  });
}
