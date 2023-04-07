import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_demos/app/barcode_scanner/components/pick_barcode_button.dart';

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
                mainAxisAlignment: MainAxisAlignment.start,
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

                  /// barcode url
                  Obx(
                    () => controller.barcodeUrl.value != Uri.parse("")
                        ? ListTile(
                            title: const Text("Open link"),
                            subtitle: Text.rich(
                              TextSpan(
                                text: controller.barcodeUrl.value.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                      fontSize: 20,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => controller.openUrl(),
                              ),
                            )).paddingAll(8)
                        : Container(),
                  ),

                  ///barcode wifi
                  Obx(
                    () => controller.barcodeWifi.value != ""
                        ? ListTile(
                            title: const Text("Wifi details"),
                            subtitle: SelectableText(
                              controller.barcodeWifi.value,
                            ),
                          ).paddingAll(8)
                        : Container(),
                  ),
                ],
              ),
            ).paddingAll(8),
          ),

          /// process barcode button
          bottomNavigationBar: ElevatedButton(
            onPressed: () => pickBarcode(),
            child: const Text(AppStrings.scanBarcode),
          ).paddingSymmetric(horizontal: 10, vertical: 10)),
    );
  }
}
