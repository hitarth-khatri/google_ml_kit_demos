import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_demos/app/text_recognize/components/pick_image_button.dart';
import 'package:google_ml_kit_demos/common/enums/loading_status.dart';
import 'package:google_ml_kit_demos/common/widgets/common_widgets.dart';

import '../../common/constants/constants.dart';
import 'text_recognize_controller.dart';

class TextRecognizeScreen extends GetView<TextRecognizeController> {
  const TextRecognizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonWidgets.appBar(
          appBarTitle: AppStrings.textRecognition,
        ),
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
                        ).paddingSymmetric(vertical: 8)
                      : const Text(AppStrings.pickImage),
                ),

                /// detected text
                Obx(
                  () => controller.loadStatus.value == LoadStatus.initial
                      ? Container()
                      : controller.loadStatus.value == LoadStatus.loading
                          ? const Center(child: CircularProgressIndicator())
                          : ListTile(
                              title: const Text(AppStrings.detectedText),
                              subtitle: SelectableText(
                                controller.detectedText.value,
                              ),
                            ).paddingAll(8),
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
