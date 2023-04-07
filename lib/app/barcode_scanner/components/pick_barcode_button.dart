import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_demos/app/barcode_scanner/barcode_scanner_controller.dart';

import '../../../common/constants/constants.dart';

pickBarcode() {
  final BarcodeScannerController controller =
      Get.find<BarcodeScannerController>();
  return Get.dialog(
    AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          galleryButton(
            galleryIconOnPressed: () => controller.selectImage(),
          ).paddingSymmetric(vertical: 8),
          cameraButton(
            cameraIconOnPressed: () => controller.selectImage(isCamera: true),
          ),
        ],
      ),
    ),
  );
}

/// camera icon button
Widget cameraButton({
  required void Function() cameraIconOnPressed,
}) {
  return FilledButton.icon(
    onPressed: () {
      Get.back();
      cameraIconOnPressed.call();
    },
    icon: AppIcons.cameraIcon,
    label: const Text("Pick from camera"),
  );
}

/// galley icon button
Widget galleryButton({
  required void Function() galleryIconOnPressed,
}) {
  return FilledButton.icon(
    onPressed: () {
      Get.back();
      galleryIconOnPressed.call();
    },
    icon: AppIcons.galleryIcon,
    label: const Text("Pick from gallery"),
  );
}
