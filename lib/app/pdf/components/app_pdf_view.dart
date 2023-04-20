import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/constants/constants.dart';
import '../pdf_controller.dart';

class AppPdfView extends GetView<PdfController> {
  const AppPdfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pdfPath = Get.arguments["pdfPath"];
    String pdfName = Get.arguments["pdfName"];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(pdfName),
          actions: [
            /// share button
            IconButton(
              onPressed: () => controller.sharePdf(
                pdfXFile: [
                  XFile(pdfPath),
                ],
              ),
              icon: AppIcons.shareIcon,
            ),
          ],
        ),

        /// pdf view
        body: PDFView(
          defaultPage: 0,
          pageFling: true,
          filePath: pdfPath,
        ),
      ),
    );
  }
}
