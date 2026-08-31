// lib/modules/cpcb/models/cpcb_target_model.dart

/// Data structure representing the CPCB EPR Compliance summary
class CpcbTargetModel {
  final double targetTonnage;    // Total obligation in MT
  final double fulfilledCredits;  // Credits procured & verified in MT
  final double deficitRisk;       // Outstanding balance MT
  final double deficitCost;       // Financial risk calculation (in INR)
  final double availableBalance; // Unassigned credits in marketplace
  final String lastSyncTime;      // Last sync date/time string
  final double lfpRemaining;     // LFP chemistry gap
  final double nmcRemaining;     // NMC chemistry gap

  CpcbTargetModel({
    required this.targetTonnage,
    required this.fulfilledCredits,
    required this.deficitRisk,
    required this.deficitCost,
    required this.availableBalance,
    required this.lastSyncTime,
    required this.lfpRemaining,
    required this.nmcRemaining,
  });

  // Calculates completion percentage for linear progress bar
  double get completionPercentage => (fulfilledCredits / targetTonnage) * 100;

  // Factory constructor to parse backend JSON response
  factory CpcbTargetModel.fromJson(Map<String, dynamic> json) {
    return CpcbTargetModel(
      targetTonnage: (json['target_tonnage'] as num).toDouble(),
      fulfilledCredits: (json['fulfilled_credits'] as num).toDouble(),
      deficitRisk: (json['deficit_risk'] as num).toDouble(),
      deficitCost: (json['deficit_cost'] as num).toDouble(),
      availableBalance: (json['available_balance'] as num).toDouble(),
      lastSyncTime: json['last_sync_time'] ?? '',
      lfpRemaining: (json['lfp_remaining'] as num).toDouble(),
      nmcRemaining: (json['nmc_remaining'] as num).toDouble(),
    );
  }
}