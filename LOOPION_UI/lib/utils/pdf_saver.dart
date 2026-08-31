class PdfSaver {
  static Future<bool> save(String fileName, List<int> bytes) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return fileName.isNotEmpty && bytes.isNotEmpty;
  }
}
