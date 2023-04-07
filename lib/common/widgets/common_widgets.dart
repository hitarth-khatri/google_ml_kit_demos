import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class CommonWidgets {
  /// circular border
  static BorderRadius circularBorder({
    double radius = 15,
  }) {
    return BorderRadius.circular(radius);
  }

  /// camera icon button
  static Widget cameraButton({
    required void Function() cameraIconOnPressed,
  }) {
    return FilledButton.icon(
      onPressed: () {
        Get.back();
        cameraIconOnPressed.call();
      },
      icon: AppIcons.cameraIcon,
      label: const Text(AppStrings.fromCamera),
    );
  }

  /// galley icon button
  static Widget galleryButton({
    required void Function() galleryIconOnPressed,
  }) {
    return FilledButton.icon(
      onPressed: () {
        Get.back();
        galleryIconOnPressed.call();
      },
      icon: AppIcons.galleryIcon,
      label: const Text(AppStrings.fromGallery),
    );
  }
}

/// debug print
commonPrint({required value}) {
  if (kDebugMode) {
    print("---------$value----------");
  }
}
