import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_demos/app/text_recognize/text_recognize_controller.dart';

import '../../../common/widgets/common_widgets.dart';

Future<void> pickImage() {
  final TextRecognizeController controller =
      Get.find<TextRecognizeController>();

  return Get.dialog(
    AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonWidgets.galleryButton(
            galleryIconOnPressed: () => controller.selectImage(),
          ).paddingSymmetric(vertical: 8),
          CommonWidgets.cameraButton(
            cameraIconOnPressed: () => controller.selectImage(isCamera: true),
          ),
        ],
      ),
    ),
  );
}
