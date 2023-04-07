import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:google_ml_kit_demos/common/widgets/common_widgets.dart';

class FaceDetectionController extends GetxController {
  XFile? galleryImage;
  var imgPath = "".obs;
  Rx<File> imageFile = File("").obs;

  final Rx<InputImage> inputImage = InputImage.fromFilePath("").obs;

  final FaceDetectorOptions options = FaceDetectorOptions();
  late final FaceDetector faceDetector = FaceDetector(options: options);
  RxInt faceCount = 0.obs;

  /// select image
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
        faceCount.value = 0;

        imgPath.value = galleryImage!.path;

        imageFile.value = File(imgPath.value);

        // process face image
        await processFaceImage();
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

  /// process barcode
  Future<void> processFaceImage() async {
    inputImage.value = InputImage.fromFilePath(imgPath.value);

    final List<Face> faces = await faceDetector.processImage(inputImage.value);

    if (faces.isNotEmpty) {
      faceCount.value = faces.length;
      commonPrint(
          value: "faces count: ${faces.length}, ${faces[0].trackingId}");
    } else {
      Get.rawSnackbar(
        title: "No faces detected",
        message: "Pick another image",
      );
    }
  }
}
