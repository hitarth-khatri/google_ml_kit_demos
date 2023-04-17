import 'package:get/get.dart';
import 'package:google_ml_kit_demos/app/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
