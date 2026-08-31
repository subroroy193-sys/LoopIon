class ScannerService {
  Future<Map<String, dynamic>> decodeQrPayload(String payload) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return {'valid': true, 'payload': payload};
  }
}
