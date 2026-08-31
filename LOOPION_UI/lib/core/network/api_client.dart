class ApiClient {
  ApiClient();

  Future<Map<String, dynamic>> get(String path) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return {'path': path, 'status': 'ok'};
  }

  Future<Map<String, dynamic>> post(String path, Map<String, dynamic> body) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return {'path': path, 'body': body, 'status': 'ok'};
  }
}
