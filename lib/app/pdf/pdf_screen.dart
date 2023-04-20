import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_ml_kit_demos/app/pdf/pdf_controller.dart';
import '../../common/constants/constants.dart';
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
              () => controller.platformPdfFileList.isEmpty
                  ? const Center(child: Text(AppStrings.pickPdf))
                  : ListView(
                      shrinkWrap: true,
                      children: controller.platformPdfFileList.map(
                        (PlatformFile platformFile) {
                          return ListTile(
                            onTap: () => Get.toNamed(
                              Routes.routeAppPdfView,
                              arguments: {
                                "pdfPath": platformFile.path,
                                "pdfName": platformFile.name,
                              },
                            ),
                            title: Text(
                              platformFile.name,
                            ),
                          ).paddingSymmetric(vertical: 5);
                        },
                      ).toList()),
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

        /// share button

        floatingActionButton: Obx(
          () => controller.platformPdfFileList.isEmpty
              ? Container()
              : FloatingActionButton(
                  onPressed: () {
                    controller.sharePdf(pdfXFile: controller.selectedPdfXFile);
                  },
                  child: AppIcons.shareIcon,
                ),
        ),
      ),
    );
  }
}
