import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

import '../../../common/constants/constants.dart';
import '../pdf_controller.dart';

class AppPdfView extends GetView<PdfController> {
  const AppPdfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Obx(
            () => Text(controller.platformPdfFile.value.name),
          ),
        ),

        /// pdf view
        body: Obx(
          () => PDFView(
            defaultPage: 0,
            pageFling: true,
            filePath: controller.platformPdfFile.value.path,
            pdfData: controller.platformPdfFile.value.bytes,
          ),
        ),

        /// share button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.sharePdf();
          },
          child: AppIcons.shareIcon,
        ),
      ),
    );
  }
}
