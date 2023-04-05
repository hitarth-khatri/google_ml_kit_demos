import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/constants.dart';
import 'barcode_scanner_controller.dart';

class BarcodeScannerScreen extends GetView<BarcodeScannerController> {
  const BarcodeScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// barcode image view
                Obx(
                  () => controller.imgPath.value != ""
                      ? InteractiveViewer(
                          panEnabled: false,
                          minScale: 1,
                          maxScale: 2,
                          child: Image.file(
                            controller.imageFile.value,
                            fit: BoxFit.contain,
                            height: AppSize.imgHeight,
                            width: AppSize.imgWidth,
                          ),
                        )
                      : const Text(AppStrings.selectImg),
                ),
              ],
            ),
          ).paddingAll(8),
        ),
      ),
    );
  }
}
