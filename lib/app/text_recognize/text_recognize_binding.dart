import 'package:get/get.dart';
import 'text_recognize_controller.dart';

class TextRecognizeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TextRecognizeController());
  }
}
