import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/constants.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// text recognition
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.routeTextRecognize),
                child: const Text(AppStrings.textRecognition),
              ).paddingSymmetric(vertical: 20),

              /// barcode scanner
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.routeBarcodeScanner),
                child: const Text(AppStrings.barcodeScanner),
              ).paddingSymmetric(vertical: 20),

              /// face detection
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.routeFaceDetection),
                child: const Text(AppStrings.faceDetection),
              ).paddingSymmetric(vertical: 20),
            ],
          ),
        ),
      ),
    );
  }
}
