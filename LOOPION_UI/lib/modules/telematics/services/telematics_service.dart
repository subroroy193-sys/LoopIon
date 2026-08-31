class TelematicsService {
  Future<List<Map<String, dynamic>>> fetchTelemetry() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return [
      {'timestamp': '2026-08-23T10:00:00Z', 'temperature': 36.5, 'voltage': 3.8},
      {'timestamp': '2026-08-23T10:05:00Z', 'temperature': 38.1, 'voltage': 3.7},
    ];
  }
}
