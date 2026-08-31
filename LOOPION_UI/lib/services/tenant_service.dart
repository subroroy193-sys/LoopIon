class TenantService {
  Future<Map<String, dynamic>> getActiveFeatures() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return {
      'features': ['cpcb_dashboard', 'marketplace', 'bpan_generator'],
      'tenantId': 'loopion-demo',
    };
  }
}
