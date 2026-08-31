class MarketplaceService {
  Future<List<Map<String, dynamic>>> fetchListings() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return [
      {'id': 'cr-1001', 'title': 'EPR Credit 1001', 'price': 420.0},
      {'id': 'cr-1002', 'title': 'EPR Credit 1002', 'price': 390.0},
    ];
  }
}
