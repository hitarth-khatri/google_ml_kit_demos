import 'package:get/get.dart';
import 'package:google_ml_kit_demos/app/pdf/pdf_controller.dart';

class PdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PdfController());
  }
}
