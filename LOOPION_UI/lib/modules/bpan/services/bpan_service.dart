class BpanService {
  Future<Map<String, dynamic>> generateBatch(Map<String, dynamic> payload) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return {'success': true, 'batchId': 'BPAN-2026-001', 'payload': payload};
  }
}
