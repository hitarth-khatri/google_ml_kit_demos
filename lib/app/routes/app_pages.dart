import 'package:get/get.dart';
import 'package:google_ml_kit_demos/app/barcode_scanner/barcode_scanner_binding.dart';
import 'package:google_ml_kit_demos/app/barcode_scanner/barcode_scanner_screen.dart';
import 'package:google_ml_kit_demos/app/face_detection/face_detection_binding.dart';
import 'package:google_ml_kit_demos/app/face_detection/face_detection_screen.dart';
import 'package:google_ml_kit_demos/app/home/home_screen.dart';
import '../text_recognize/text_recognize_binding.dart';
import '../text_recognize/text_recognize_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    /// home screen
    GetPage(
      name: Routes.routeHome,
      page: () => const HomeScreen(),
    ),

    /// text recognize screen
    GetPage(
      name: Routes.routeTextRecognize,
      page: () => const TextRecognizeScreen(),
      binding: TextRecognizeBinding(),
    ),

    /// barcode scanner screen
    GetPage(
      name: Routes.routeBarcodeScanner,
      page: () => const BarcodeScannerScreen(),
      binding: BarcodeScannerBinding(),
    ),

    /// face detection screen
    GetPage(
      name: Routes.routeFaceDetection,
      page: () => const FaceDetectionScreen(),
      binding: FaceDetectionBinding(),
    ),
  ];
}
