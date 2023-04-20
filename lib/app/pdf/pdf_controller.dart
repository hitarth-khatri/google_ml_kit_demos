import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class PdfController extends GetxController {
  Rx<PlatformFile> platformPdfFile = PlatformFile(name: "", size: 1).obs;

  /// pick pdf
  Future<void> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf"],
    );

    if (result != null) {
      platformPdfFile.value = result.files.first;
      print("file: ${platformPdfFile.value}");
    }
  }

  /// share pdf
  void sharePdf() {
    Share.shareXFiles(
      [
        XFile(platformPdfFile.value.path!),
      ],
    );
  }
}
