import 'package:flutter/material.dart';

import '../modules/bpan/screens/bpan_generator_screen.dart';
import '../modules/bpan_scanner/screens/bpan_scanner_screen.dart';
import '../modules/cpcb/screens/cpcb_dashboard_screen.dart';
import '../modules/cpcb/screens/form3_export_screen.dart';
import '../modules/marketplace/screens/credit_marketplace_screen.dart';
import '../modules/telematics/screens/telematics_heatmap_screen.dart';
import '../modules/warranty/screens/warranty_claims_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String cpcbDashboard = '/cpcb-dashboard';
  static const String form3Export = '/form3-export';
  static const String marketplace = '/marketplace';
  static const String warranty = '/warranty';
  static const String bpan = '/bpan';
  static const String scanner = '/bpan-scanner';
  static const String telematics = '/telematics';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
      case AppRoutes.cpcbDashboard:
        return MaterialPageRoute(
          builder: (_) => const CpcbDashboardScreen(),
          settings: settings,
        );
      case AppRoutes.form3Export:
        return MaterialPageRoute(
          builder: (_) => const Form3ExportScreen(),
          settings: settings,
        );
      case AppRoutes.marketplace:
        return MaterialPageRoute(
          builder: (_) => const CreditMarketplaceScreen(),
          settings: settings,
        );
      case AppRoutes.warranty:
        return MaterialPageRoute(
          builder: (_) => const WarrantyClaimsScreen(),
          settings: settings,
        );
      case AppRoutes.bpan:
        return MaterialPageRoute(
          builder: (_) => const BpanGeneratorScreen(),
          settings: settings,
        );
      case AppRoutes.scanner:
        return MaterialPageRoute(
          builder: (_) => const BpanScannerScreen(),
          settings: settings,
        );
      case AppRoutes.telematics:
        return MaterialPageRoute(
          builder: (_) => const TelematicsHeatmapScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
