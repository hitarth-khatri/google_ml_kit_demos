import 'package:get/get.dart';
import 'package:google_ml_kit_demos/app/barcode_scanner/barcode_scanner_controller.dart';

class BarcodeScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BarcodeScannerController());
  }
}
