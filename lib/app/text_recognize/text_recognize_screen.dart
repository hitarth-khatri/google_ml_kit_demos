import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                            height: 450,
                            width: 350,
                          ),
                        )
                      : const Text("Select Image"),
                ),

                /// detected text
                Obx(
                  () => controller.detectedText.value != ""
                      ? ListTile(
                          title: const Text("Detected Text"),
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

        /// upload image button
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.selectImage(),
          child: const Icon(Icons.photo),
        ),

        /// recognize text button
        bottomNavigationBar: FilledButton(
          onPressed: () => controller.recognizeText(),
          child: const Text("Recognize Text"),
        ).paddingAll(10),
      ),
    );
  }
}
