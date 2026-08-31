// lib/modules/cpcb/screens/cpcb_dashboard_screen.dart

import 'package:flutter/material.dart';
import '../services/cpcb_service.dart';
import '../models/cpcb_target_model.dart';
import '../../marketplace/models/credit_order_model.dart';

class CpcbDashboardScreen extends StatefulWidget {
  const CpcbDashboardScreen({super.key});

  @override
  State<CpcbDashboardScreen> createState() => _CpcbDashboardScreenState();
}

class _CpcbDashboardScreenState extends State<CpcbDashboardScreen> {
  final CpcbService _cpcbService = CpcbService();
  
  bool _isLoading = true;
  CpcbTargetModel? _summary;
  List<CreditListingModel> _listings = [];

  @override
  void initState() {
    super.initState();
    _loadDashboardData();
  }

  Future<void> _loadDashboardData() async {
    setState(() => _isLoading = true);
    final summaryData = await _cpcbService.fetchEprSummary();
    final listingsData = await _cpcbService.fetchMarketplaceListings();
    
    setState(() {
      _summary = summaryData;
      _listings = listingsData;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F19),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xFF3B82F6)),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                final isCompact = constraints.maxWidth < 1000;

                final mainContent = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 20),
                    _buildMetricCards(),
                    const SizedBox(height: 20),
                    _buildFulfillmentProgress(),
                    const SizedBox(height: 20),
                    _buildMarketplaceTable(),
                    const SizedBox(height: 20),
                    _buildActionFooter(),
                  ],
                );

                final sideContent = Column(
                  children: [
                    _buildSyncPanel(),
                    const SizedBox(height: 20),
                    _buildQuickSummaryPanel(),
                    const SizedBox(height: 20),
                    _buildNotificationsPanel(),
                  ],
                );

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: isCompact
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            mainContent,
                            const SizedBox(height: 20),
                            sideContent,
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: mainContent,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 1,
                              child: sideContent,
                            ),
                          ],
                        ),
                );
              },
            ),
    );
  }

  // --- HEADER SECTION ---
  Widget _buildHeader() {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      runSpacing: 12,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.grid_view_rounded, color: Colors.white70),
            const SizedBox(width: 12),
            const Flexible(
              child: Text(
                'EPR Compliance Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 16,
          runSpacing: 8,
          children: [
            Text(
              'Last Sync: ${_summary?.lastSyncTime}',
              style: const TextStyle(color: Colors.white54, fontSize: 13),
            ),
            ElevatedButton.icon(
              onPressed: _loadDashboardData,
              icon: const Icon(Icons.sync, size: 16),
              label: const Text('Sync CPCB Data'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E293B),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --- TOP METRIC CARDS ---
  Widget _buildMetricCards() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        SizedBox(
          width: 210,
          child: _metricCard('Target Tonnage', '${_summary?.targetTonnage} MT', 'FY 2026-27 (BMWR)', const Color(0xFF1E1B4B), Colors.indigoAccent, Icons.ads_click),
        ),
        SizedBox(
          width: 210,
          child: _metricCard('Fulfilled Credits', '${_summary?.fulfilledCredits} MT (70.5%)', '(CPCB Verified)', const Color(0xFF064E3B), Colors.greenAccent, Icons.check_circle_outline),
        ),
        SizedBox(
          width: 210,
          child: _metricCard('Deficit Risk', '${_summary?.deficitRisk} MT', '(₹2.84L)', const Color(0xFF451A03), Colors.orangeAccent, Icons.warning_amber_rounded),
        ),
        SizedBox(
          width: 210,
          child: _metricCard('Available Balance', '${_summary?.availableBalance} MT', '(Marketplace)', const Color(0xFF311042), Colors.purpleAccent, Icons.pie_chart_outline),
        ),
      ],
    );
  }

  Widget _metricCard(String title, String value, String subtitle, Color bgColor, Color accentColor, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: accentColor, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(title, style: const TextStyle(color: Colors.white70, fontSize: 13)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: accentColor, fontSize: 12)),
        ],
      ),
    );
  }

  // --- PROGRESS SECTION ---
  Widget _buildFulfillmentProgress() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFF1E293B).withValues(alpha: 0.5), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 8,
            children: [
              const Text('FULFILLMENT PROGRESS', style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold)),
              Text('${_summary?.completionPercentage.toStringAsFixed(1)}%', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: (_summary?.completionPercentage ?? 0) / 100,
              minHeight: 10,
              backgroundColor: Colors.blueGrey.shade800,
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF10B981)),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 20,
            runSpacing: 8,
            children: [
              Text('• LFP Target: ${_summary?.lfpRemaining} MT Remaining', style: const TextStyle(color: Colors.blueAccent, fontSize: 12)),
              Text('• NMC Target: ${_summary?.nmcRemaining} MT Remaining', style: const TextStyle(color: Colors.purpleAccent, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  // --- MARKETPLACE TABLE ---
  Widget _buildMarketplaceTable() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFF1E293B).withValues(alpha: 0.5), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('MARKETPLACE LISTINGS', style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(1.5),
              2: FlexColumnWidth(1.5),
              3: FlexColumnWidth(1.5),
              4: FlexColumnWidth(1),
            },
            children: [
              const TableRow(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white12))),
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text('Recycler Partner', style: TextStyle(color: Colors.white54, fontSize: 12))),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text('Chemistry', style: TextStyle(color: Colors.white54, fontSize: 12))),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text('Available Tonnage', style: TextStyle(color: Colors.white54, fontSize: 12))),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text('Price / MT', style: TextStyle(color: Colors.white54, fontSize: 12))),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text('Action', style: TextStyle(color: Colors.white54, fontSize: 12))),
                ],
              ),
              ..._listings.map((item) => TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(item.recyclerName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(item.chemistry, style: const TextStyle(color: Colors.white70)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text('${item.availableTonnage} MT', style: const TextStyle(color: Colors.white70)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text('₹${item.pricePerMt.toStringAsFixed(0)}', style: const TextStyle(color: Colors.white70)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF059669), foregroundColor: Colors.white),
                      child: const Text('Buy'),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }

  // --- FOOTER ACTIONS ---
  Widget _buildActionFooter() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        SizedBox(
          width: 320,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.3)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Generate CPCB Form 1(A)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text('Create & download CPCB Form 1(A)', style: TextStyle(color: Colors.white54, fontSize: 12)),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.blueAccent),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 320,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.purpleAccent.withValues(alpha: 0.3)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Export PDF', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text('Download dashboard as PDF', style: TextStyle(color: Colors.white54, fontSize: 12)),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.purpleAccent),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // --- RIGHT SIDE PANEL WIDGETS ---
  Widget _buildSyncPanel() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1E293B).withValues(alpha: 0.5), borderRadius: BorderRadius.circular(12)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('SYNC CPCB DATA', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.cloud_done_outlined, color: Colors.greenAccent),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Data is up to date', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                  Text('12 May 2025, 12:15 PM', style: TextStyle(color: Colors.white54, fontSize: 11)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickSummaryPanel() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1E293B).withValues(alpha: 0.5), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('QUICK SUMMARY', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _summaryRow('Target Tonnage', '${_summary?.targetTonnage} MT', Colors.indigoAccent),
          _summaryRow('Fulfilled Credits', '${_summary?.fulfilledCredits} MT (70.5%)', Colors.greenAccent),
          _summaryRow('Deficit Risk', '${_summary?.deficitRisk} MT (₹2.84L)', Colors.orangeAccent),
          _summaryRow('Available Balance', '${_summary?.availableBalance} MT', Colors.purpleAccent),
        ],
      ),
    );
  }

  Widget _summaryRow(String title, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white60, fontSize: 12)),
          Text(value, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildNotificationsPanel() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1E293B).withValues(alpha: 0.5), borderRadius: BorderRadius.circular(12)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('NOTIFICATIONS', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text('• Deficit risk above 20%. Consider purchasing additional credits.', style: TextStyle(color: Colors.orangeAccent, fontSize: 12)),
          SizedBox(height: 8),
          Text('• New recycler partner listed: GreenMetals Inc', style: TextStyle(color: Colors.white60, fontSize: 12)),
        ],
      ),
    );
  }
}