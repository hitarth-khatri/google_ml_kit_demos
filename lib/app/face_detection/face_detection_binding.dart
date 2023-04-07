import 'package:get/get.dart';
import 'face_detection_controller.dart';

class FaceDetectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaceDetectionController());
  }
}
