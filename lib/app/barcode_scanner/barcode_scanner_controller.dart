import 'dart:io';

import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class BarcodeScannerController extends GetxController {
  XFile? galleryImage;
  var imgPath = "".obs;
  Rx<File> imageFile = File("").obs;

  final Rx<InputImage> inputImage = InputImage.fromFilePath("").obs;

// TODO: implement barcode scanner
}
