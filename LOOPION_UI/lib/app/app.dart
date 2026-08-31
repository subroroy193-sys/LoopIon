import 'package:flutter/material.dart';

import '../config/features_config.dart';
import '../config/roles_config.dart';
import '../core/widgets/dynamic_drawer.dart';
import '../modules/bpan/screens/bpan_generator_screen.dart';
import '../modules/bpan_scanner/screens/bpan_scanner_screen.dart';
import '../modules/cpcb/screens/cpcb_dashboard_screen.dart';
import '../modules/cpcb/screens/form3_export_screen.dart';
import '../modules/marketplace/screens/credit_marketplace_screen.dart';
import '../modules/telematics/screens/telematics_heatmap_screen.dart';
import '../modules/warranty/screens/warranty_claims_screen.dart';
import 'routes.dart';
import 'theme.dart';

class LoopionApp extends StatelessWidget {
  const LoopionApp({
    super.key,
    this.role = RolesConfig.superAdmin,
  });

  final String role;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoopIon',
      debugShowCheckedModeBanner: false,
      theme: LoopionTheme.light,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.home,
      home: AppShell(role: role),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Text(
            'LoopIon',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
              color: Color(0xFF0F172A),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Operations Suite',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF475569),
            ),
          ),
        ],
      ),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.role});

  final String role;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late String _selectedRoute;

  @override
  void initState() {
    super.initState();
    _selectedRoute = AppRoutes.home;
  }

  List<FeatureDefinition> get _enabledFeatures =>
      FeaturesConfig.enabledFeaturesForRole(widget.role);

  String _screenTitle(String route) {
    switch (route) {
      case AppRoutes.cpcbDashboard:
        return 'EPR Dashboard';
      case AppRoutes.form3Export:
        return 'Form 3 Export';
      case AppRoutes.marketplace:
        return 'Marketplace';
      case AppRoutes.warranty:
        return 'Warranty Claims';
      case AppRoutes.bpan:
        return 'BPAN Generator';
      case AppRoutes.scanner:
        return 'BPAN Scanner';
      case AppRoutes.telematics:
        return 'Telematics Heatmap';
      case AppRoutes.home:
      default:
        return 'LoopIon';
    }
  }

  Widget _buildScreen(String route) {
    switch (route) {
      case AppRoutes.home:
        return const HomeScreen();
      case AppRoutes.cpcbDashboard:
        return const CpcbDashboardScreen();
      case AppRoutes.form3Export:
        return const Form3ExportScreen();
      case AppRoutes.marketplace:
        return const CreditMarketplaceScreen();
      case AppRoutes.warranty:
        return const WarrantyClaimsScreen();
      case AppRoutes.bpan:
        return const BpanGeneratorScreen();
      case AppRoutes.scanner:
        return const BpanScannerScreen();
      case AppRoutes.telematics:
        return const TelematicsHeatmapScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasEnabledDashboard = _enabledFeatures.any(
      (feature) => feature.route == AppRoutes.cpcbDashboard,
    );

    if (!hasEnabledDashboard && _enabledFeatures.isNotEmpty) {
      _selectedRoute = _enabledFeatures.first.route;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitle(_selectedRoute)),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: DynamicDrawer(
        items: _enabledFeatures,
        selectedRoute: _selectedRoute,
        onSelect: (route) {
          setState(() => _selectedRoute = route);
          Navigator.of(context).pop();
        },
      ),
      body: _buildScreen(_selectedRoute),
    );
  }
}

