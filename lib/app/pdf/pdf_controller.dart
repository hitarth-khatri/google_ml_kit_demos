import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class PdfController extends GetxController {
  @override
  Future<void> onClose() async {
    await FilePicker.platform.clearTemporaryFiles();
    super.onClose();
  }

  RxList<PlatformFile> selectedFileList = <PlatformFile>[].obs;
  List<XFile> selectedXFileList = <XFile>[].obs;

  /// pick pdf
  Future<void> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        "pdf",
        "PDF",
      ],
      allowMultiple: true,
    );

    if (result != null) {
      selectedFileList.addAll(result.files);

      for (var selectedFile in selectedFileList) {
        selectedXFileList.add(
          XFile(selectedFile.path!),
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
