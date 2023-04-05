import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_demos/app/routes/app_routes.dart';

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
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.routeTextRecognize),
                child: const Text("Text Recognition"),
              ).paddingSymmetric(vertical: 30),

              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.routeBarcodeScanner),
                child: const Text("Barcode Scanner"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
