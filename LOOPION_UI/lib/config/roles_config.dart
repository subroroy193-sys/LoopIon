class RolesConfig {
  static const String superAdmin = 'super_admin';
  static const String admin = 'admin';
  static const String manager = 'manager';
  static const String user = 'user';

  static const Map<String, List<String>> rolePermissions = {
    superAdmin: [
      'cpcb_dashboard',
      'cpcb_form3_export',
      'marketplace',
      'warranty_claims',
      'bpan_generator',
      'bpan_scanner',
      'telematics_heatmap',
    ],
    admin: [
      'cpcb_dashboard',
      'cpcb_form3_export',
      'marketplace',
      'warranty_claims',
      'bpan_generator',
      'bpan_scanner',
    ],
    manager: [
      'cpcb_dashboard',
      'marketplace',
      'warranty_claims',
      'bpan_generator',
    ],
    user: [
      'bpan_scanner',
    ],
  };
}
