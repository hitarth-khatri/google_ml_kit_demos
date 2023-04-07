import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/constants.dart';
import '../../common/widgets/common_widgets.dart';
import 'face_detection_controller.dart';
import 'components/pick_face_detection_image_button.dart';

class FaceDetectionScreen extends GetView<FaceDetectionController> {
  const FaceDetectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonWidgets.appBar(
          appBarTitle: AppStrings.faceDetection,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                            fit: BoxFit.contain,
                            height: AppSize.imgHeight,
                            width: AppSize.imgWidth,
                          ),
                        )
                      : const Text(AppStrings.pickImage),
                ),

                /// face count
                Obx(
                  () => controller.faceCount.value != 0
                      ? ListTile(
                          title: const Text(AppStrings.faceCountString),
                          subtitle: SelectableText(
                            controller.faceCount.value.toString(),
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
          onPressed: () => pickFaceImage(),
          child: const Text(AppStrings.pickImage),
        ).paddingSymmetric(horizontal: 10, vertical: 10),
      ),
    );
  }
}
