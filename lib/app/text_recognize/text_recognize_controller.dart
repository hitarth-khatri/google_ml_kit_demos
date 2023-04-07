import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_demos/common/widgets/common_widgets.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class TextRecognizeController extends GetxController {
  @override
  void onClose() {
    textRecognizer.close();
    super.onClose();
  }

  XFile? galleryImage;
  XFile? cameraImage;

  var imgPath = "".obs;
  Rx<File> imageFile = File("").obs;

  final Rx<InputImage> inputImage = InputImage.fromFilePath("").obs;

  TextRecognizer textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);

  RecognizedText? recognizedText;
  RxString detectedText = "".obs;

  /// select gallery image
  Future<void> selectImage({
    bool isCamera = false,
  }) async {
    PermissionStatus? status;

    defaultTargetPlatform == TargetPlatform.iOS
        ? status = await Permission.photos.request()
        : status = await Permission.storage.request();

    if (status.isGranted) {
      commonPrint(value: "Permission Granted");

      galleryImage = await ImagePicker().pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 50,
      );

      if (galleryImage != null) {
        detectedText.value = "";

        imgPath.value = galleryImage!.path;

        imageFile.value = File(imgPath.value);

        recognizeText();
      } else {
        commonPrint(value: "image null");
      }
    } else if (status.isPermanentlyDenied) {
      commonPrint(value: "Permission Denied");
      Get.defaultDialog(
        middleText: "Permission denied",
        confirm: OutlinedButton(
          onPressed: () => openAppSettings(),
          child: const Text("open setting"),
        ),
      );
    }
  }

  /// recognize text
  Future<void> recognizeText() async {
    inputImage.value = InputImage.fromFilePath(imgPath.value);

    if (imgPath.value != "") {
      recognizedText = await textRecognizer.processImage(inputImage.value);
      detectedText.value = recognizedText!.text;
      if (recognizedText?.text == "") {
        Get.rawSnackbar(
          title: "No Text Detected",
          message: "Select another image",
        );
      }
      commonPrint(value: "recognizedText: ${recognizedText!.text}");
    } else {
      Get.rawSnackbar(
        title: "Please select image",
        message: "Must select image to recognize text",
      );
    }
  }
}
