// lib/modules/marketplace/models/credit_order_model.dart

/// Data structure for Recycler Listings in the EPR Marketplace
class CreditListingModel {
  final String id;
  final String recyclerName;
  final String chemistry; // LFP, NMC, Lead-Acid
  final double availableTonnage;
  final double pricePerMt;

  CreditListingModel({
    required this.id,
    required this.recyclerName,
    required this.chemistry,
    required this.availableTonnage,
    required this.pricePerMt,
  });

  // Factory constructor for parsing backend JSON listings
  factory CreditListingModel.fromJson(Map<String, dynamic> json) {
    return CreditListingModel(
      id: json['id'],
      recyclerName: json['recycler_name'],
      chemistry: json['chemistry'],
      availableTonnage: (json['available_tonnage'] as num).toDouble(),
      pricePerMt: (json['price_per_mt'] as num).toDouble(),
    );
  }
}