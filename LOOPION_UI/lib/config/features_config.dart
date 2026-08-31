import 'package:flutter/material.dart';

import '../app/routes.dart';
import 'roles_config.dart';

class FeatureDefinition {
  final String id;
  final String label;
  final String route;
  final IconData icon;

  const FeatureDefinition({
    required this.id,
    required this.label,
    required this.route,
    required this.icon,
  });
}

class FeaturesConfig {
  static const String cpcbDashboard = 'cpcb_dashboard';
  static const String cpcbForm3Export = 'cpcb_form3_export';
  static const String marketplace = 'marketplace';
  static const String warrantyClaims = 'warranty_claims';
  static const String bpanGenerator = 'bpan_generator';
  static const String bpanScanner = 'bpan_scanner';
  static const String telematicsHeatmap = 'telematics_heatmap';

  static const Map<String, bool> defaults = {
    cpcbDashboard: true,
    cpcbForm3Export: true,
    marketplace: true,
    warrantyClaims: true,
    bpanGenerator: true,
    bpanScanner: true,
    telematicsHeatmap: true,
  };

  static const Map<String, FeatureDefinition> registry = {
    cpcbDashboard: FeatureDefinition(
      id: cpcbDashboard,
      label: 'EPR Dashboard',
      route: AppRoutes.cpcbDashboard,
      icon: Icons.dashboard_rounded,
    ),
    cpcbForm3Export: FeatureDefinition(
      id: cpcbForm3Export,
      label: 'Form 3 Export',
      route: AppRoutes.form3Export,
      icon: Icons.file_download_rounded,
    ),
    marketplace: FeatureDefinition(
      id: marketplace,
      label: 'Marketplace',
      route: AppRoutes.marketplace,
      icon: Icons.storefront_rounded,
    ),
    warrantyClaims: FeatureDefinition(
      id: warrantyClaims,
      label: 'Warranty Claims',
      route: AppRoutes.warranty,
      icon: Icons.shield_rounded,
    ),
    bpanGenerator: FeatureDefinition(
      id: bpanGenerator,
      label: 'BPAN Generator',
      route: AppRoutes.bpan,
      icon: Icons.generating_tokens_rounded,
    ),
    bpanScanner: FeatureDefinition(
      id: bpanScanner,
      label: 'BPAN Scanner',
      route: AppRoutes.scanner,
      icon: Icons.qr_code_scanner_rounded,
    ),
    telematicsHeatmap: FeatureDefinition(
      id: telematicsHeatmap,
      label: 'Telematics Heatmap',
      route: AppRoutes.telematics,
      icon: Icons.map_rounded,
    ),
  };

  static List<FeatureDefinition> enabledFeaturesForRole(String role) {
    final permissions = RolesConfig.rolePermissions[role] ??
        RolesConfig.rolePermissions[RolesConfig.user] ??
        const <String>[];

    return permissions
        .where((featureId) => defaults[featureId] ?? false)
        .map((featureId) => registry[featureId] ?? const FeatureDefinition(
          id: '',
          label: '',
          route: AppRoutes.home,
          icon: Icons.help_outline,
        ))
        .where((feature) => feature.id.isNotEmpty)
        .toList();
  }
}
