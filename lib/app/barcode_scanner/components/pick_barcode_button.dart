import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_ml_kit_demos/app/barcode_scanner/barcode_scanner_controller.dart';
import 'package:google_ml_kit_demos/common/widgets/common_widgets.dart';

Future<void> pickBarcode() {
  final BarcodeScannerController controller =
      Get.find<BarcodeScannerController>();
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
