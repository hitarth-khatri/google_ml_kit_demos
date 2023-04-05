import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarcodeScannerScreen extends StatelessWidget {
  const BarcodeScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
               Text("Barcode scanner"),
              ],
            ),
          ).paddingAll(8),
        ),
      ),
    );
  }
}
