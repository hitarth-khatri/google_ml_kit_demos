import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_demos/app/text_recognize/components/pick_image_button.dart';

import '../../common/constants/constants.dart';
import 'text_recognize_controller.dart';

class TextRecognizeScreen extends GetView<TextRecognizeController> {
  const TextRecognizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// image view
                Obx(
                  () => controller.imgPath.value != ""
                      ? InteractiveViewer(
                          panEnabled: false,
                          minScale: 1,
                          maxScale: 2,
                          child: Image.file(
                            controller.imageFile.value,
                            fit: BoxFit.fitHeight,
                            height: AppSize.imgHeight,
                            width: AppSize.imgWidth,
                          ),
                        )
                      : const Text(AppStrings.pickImage),
                ),

                /// detected text
                Obx(
                  () => controller.detectedText.value != ""
                      ? ListTile(
                          title: const Text(AppStrings.detectedText),
                          subtitle: SelectableText(
                            controller.detectedText.value,
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
          onPressed: () => pickImage(),
          child: const Text(AppStrings.pickImage),
        ).paddingSymmetric(horizontal: 10, vertical: 10),
      ),
    );
  }
}
