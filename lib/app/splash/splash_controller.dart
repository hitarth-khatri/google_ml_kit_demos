import 'dart:async';
import 'package:get/get.dart';
import 'package:google_ml_kit_demos/common/constants/app_strings.dart';
import 'package:quick_actions/quick_actions.dart';

import '../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () {
      /// app opened normally
      if (!isShortcut) {
        Get.offNamed(Routes.routeHome);
      }

      initializeQuickAction();
    });

    initializeShortcut();

    super.onInit();
  }

  QuickActions quickActions = const QuickActions();
  bool isShortcut = false;

  /// quick action initialize
  void initializeQuickAction() {
    quickActions.initialize((String shortcutType) {
      isShortcut = true;

      switch (shortcutType) {
        case Routes.routeTextRecognize:
          Get.offNamed(Routes.routeTextRecognize);
          break;
        case Routes.routeBarcodeScanner:
          Get.offNamed(Routes.routeBarcodeScanner);
          break;
        case Routes.routeFaceDetection:
          Get.offNamed(Routes.routeFaceDetection);
          break;
        case Routes.routePdf:
          Get.offNamed(Routes.routePdf);
          break;
        default:
          Get.offNamed(Routes.routeHome);
      }
    });
  }

  /// set shortcut
  void initializeShortcut() {
    quickActions.setShortcutItems(
      <ShortcutItem>[
        /// barcode
        const ShortcutItem(
          type: Routes.routeBarcodeScanner,
          localizedTitle: AppStrings.barcodeScanner,
        ),

        /// text recognize
        const ShortcutItem(
          type: Routes.routeTextRecognize,
          localizedTitle: AppStrings.textRecognition,
        ),

        /// face detection
        const ShortcutItem(
          type: Routes.routeFaceDetection,
          localizedTitle: AppStrings.faceDetection,
        ),

        /// pdf viewer
        const ShortcutItem(
          type: Routes.routePdf,
          localizedTitle: AppStrings.pdfViewer,
        ),
      ],
    );
  }
}
