import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class PdfController extends GetxController {
  @override
  Future<void> onClose() async {
    await FilePicker.platform.clearTemporaryFiles();
    super.onClose();
  }

  RxList<PlatformFile> platformPdfFileList = <PlatformFile>[].obs;
  List<XFile> selectedPdfXFile = <XFile>[].obs;

  /// pick pdf
  Future<void> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf"],
      allowMultiple: true,
    );

    if (result != null) {
      platformPdfFileList.addAll(result.files);

      for (var selectedXFile in platformPdfFileList) {
        selectedPdfXFile.add(
          XFile(selectedXFile.path!),
        );
      }
    }
  }

  /// share pdf
  void sharePdf({
    required List<XFile> pdfXFile,
  }) {
    Share.shareXFiles(pdfXFile);
  }
}
