import 'package:get/get.dart';
import 'package:google_ml_kit_demos/app/barcode_scanner/barcode_scanner_binding.dart';
import 'package:google_ml_kit_demos/app/barcode_scanner/barcode_scanner_screen.dart';
import 'package:google_ml_kit_demos/app/face_detection/face_detection_binding.dart';
import 'package:google_ml_kit_demos/app/face_detection/face_detection_screen.dart';
import 'package:google_ml_kit_demos/app/home/home_screen.dart';
import 'package:google_ml_kit_demos/app/pdf/components/app_pdf_view.dart';
import 'package:google_ml_kit_demos/app/pdf/pdf_screen.dart';
import 'package:google_ml_kit_demos/app/splash/splash_binding.dart';
import '../pdf/pdf_binding.dart';
import '../splash/splash_screen.dart';
import '../text_recognize/text_recognize_binding.dart';
import '../text_recognize/text_recognize_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    /// splash screen
    GetPage(
      name: Routes.routeSplash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),

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

    /// pdf screen
    GetPage(
      name: Routes.routePdf,
      page: () => const PdfScreen(),
      binding: PdfBinding(),
    ),

    /// app pdf view
    GetPage(
      name: Routes.routeAppPdfView,
      page: () => const AppPdfView(),
    ),
  ];
}
