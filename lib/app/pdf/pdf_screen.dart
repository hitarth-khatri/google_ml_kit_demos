import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_demos/app/pdf/pdf_controller.dart';
import 'package:google_ml_kit_demos/common/constants/app_strings.dart';

import '../routes/app_routes.dart';

class PdfScreen extends GetView<PdfController> {
  const PdfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.pdfViewer),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// pdf name
            Obx(
              () => controller.platformPdfFile.value.name == ""
                  ? const Center(child: Text(AppStrings.pickPdf))
                  : ListTile(
                      onTap: () => Get.toNamed(Routes.routeAppPdfView),
                      title: Text(
                        controller.platformPdfFile.value.name,
                      ),
                    ),
            ),
          ],
        ),

        /// pick pdf
        bottomNavigationBar: ElevatedButton(
          onPressed: () {
            controller.pickPdf();
          },
          child: const Text(AppStrings.pickPdf),
        ).paddingSymmetric(horizontal: 10, vertical: 10),
      ),
    );
  }
}
