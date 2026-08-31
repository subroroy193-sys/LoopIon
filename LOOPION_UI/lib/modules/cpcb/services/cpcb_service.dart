// lib/modules/cpcb/services/cpcb_service.dart

import 'dart:async';
import '../models/cpcb_target_model.dart';
import '../../marketplace/models/credit_order_model.dart';
// import '../../../../core/network/api_client.dart'; // UNCOMMENT WHEN BACKEND IS READY

class CpcbService {
  // final ApiClient _apiClient = ApiClient(); // UNCOMMENT WHEN BACKEND IS READY

  /// Fetches CPCB EPR Compliance Summary
  Future<CpcbTargetModel> fetchEprSummary() async {
    // -----------------------------------------------------------------------
    // REAL BACKEND API IMPLEMENTATION (COMMENTED OUT FOR NOW)
    // -----------------------------------------------------------------------
    // try {
    //   final response = await _apiClient.get('/v1/cpcb/epr-summary');
    //   return CpcbTargetModel.fromJson(jsonDecode(response.body));
    // } catch (e) {
    //   throw Exception('Failed to fetch CPCB EPR Summary: $e');
    // }
    // -----------------------------------------------------------------------

    // MOCK DATA MATCHING YOUR DASHBOARD IMAGE
    await Future.delayed(const Duration(milliseconds: 400)); // Simulate API latency
    return CpcbTargetModel(
      targetTonnage: 120.5,
      fulfilledCredits: 85.0,
      deficitRisk: 35.5,
      deficitCost: 284000.0, // ₹2.84L
      availableBalance: 12.0,
      lastSyncTime: '12 May 2025, 12:15 PM',
      lfpRemaining: 25.0,
      nmcRemaining: 10.5,
    );
  }

  /// Fetches Marketplace Listings from Recyclers
  Future<List<CreditListingModel>> fetchMarketplaceListings() async {
    // -----------------------------------------------------------------------
    // REAL BACKEND API IMPLEMENTATION (COMMENTED OUT FOR NOW)
    // -----------------------------------------------------------------------
    // try {
    //   final response = await _apiClient.get('/v1/marketplace/listings');
    //   final List rawList = jsonDecode(response.body);
    //   return rawList.map((e) => CreditListingModel.fromJson(e)).toList();
    // } catch (e) {
    //   throw Exception('Failed to fetch Marketplace Listings: $e');
    // }
    // -----------------------------------------------------------------------

    // MOCK DATA MATCHING YOUR DASHBOARD IMAGE
    await Future.delayed(const Duration(milliseconds: 400));
    return [
      CreditListingModel(
        id: '1',
        recyclerName: 'EcoRecycle India',
        chemistry: 'LFP',
        availableTonnage: 15.0,
        pricePerMt: 7500.0,
      ),
      CreditListingModel(
        id: '2',
        recyclerName: 'GreenMetals Inc',
        chemistry: 'NMC',
        availableTonnage: 40.0,
        pricePerMt: 8200.0,
      ),
      CreditListingModel(
        id: '3',
        recyclerName: 'CleanBatt Ltd',
        chemistry: 'Lead-Acid',
        availableTonnage: 10.0,
        pricePerMt: 6900.0,
      ),
    ];
  }
}