import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_demos/app/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
