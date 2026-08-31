class WarrantyService {
  Future<Map<String, dynamic>> submitClaim(Map<String, dynamic> payload) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return {'success': true, 'claimId': 'WM-1001', 'payload': payload};
  }
}
