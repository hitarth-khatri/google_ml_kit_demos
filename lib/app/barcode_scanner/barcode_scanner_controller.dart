import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class BarcodeScannerController extends GetxController {
  XFile? galleryImage;
  var imgPath = "".obs;
  Rx<File> imageFile = File("").obs;

  final Rx<InputImage> inputImage = InputImage.fromFilePath("").obs;

  final barcodeScanner = BarcodeScanner();
  late List<Barcode> barcodes;

  final Rx<Uri> barcodeUrl = Uri.parse("").obs;
  final RxString barcodeWifi = "".obs;

  /// select image
  Future<void> selectImage({
    bool isCamera = false,
  }) async {
    PermissionStatus? status;

    defaultTargetPlatform == TargetPlatform.iOS
        ? status = await Permission.photos.request()
        : status = await Permission.storage.request();

    if (status.isGranted) {
      print("Permission Granted");

      galleryImage = await ImagePicker().pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 50,
      );

      if (galleryImage != null) {
        barcodeUrl.value = Uri.parse("");

        imgPath.value = galleryImage!.path;

        imageFile.value = File(imgPath.value);

        // process barcode
        await processBarcode();
      } else {
        print("image null");
      }
    } else if (status.isPermanentlyDenied) {
      print("Permission Denied");
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
  Future<void> processBarcode() async {
    inputImage.value = InputImage.fromFilePath(imgPath.value);

    barcodes = await barcodeScanner.processImage(inputImage.value);

    barcodeUrl.value = Uri.parse("");
    barcodeWifi.value = "";

    for (Barcode barcode in barcodes) {
      final BarcodeType barcodeType = barcode.type;
      final String? displayValue = barcode.displayValue;
      final String? rawValue = barcode.rawValue;

      /// handle barcode type
      switch (barcodeType) {
        case BarcodeType.url:
          barcodeUrl.value = Uri.parse("$rawValue");
          print("displayValue: $displayValue , rawValue: $rawValue");
          print("url barcode");
          break;
        case BarcodeType.wifi:
          print("displayValue: $displayValue , rawValue: $rawValue");
          barcodeWifi.value = displayValue!;
          print("wifi barcode");
          break;
        default:
          print("default barcoded");
          break;
      }
    }
  }

  /// launch barcode url
  Future<void> openUrl() async {
    try {
      await launchUrl(barcodeUrl.value, mode: LaunchMode.externalApplication);
      print("url launched");
    } catch (e) {
      Get.rawSnackbar(
        title: "Unable to launch url",
        message: "Link is not valid",
      );
      print(e);
    }
  }
}
