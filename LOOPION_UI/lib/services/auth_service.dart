class AuthService {
  Future<Map<String, dynamic>> login(String username, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    if (username.isEmpty || password.isEmpty) {
      return {'success': false, 'message': 'Invalid credentials'};
    }

    return {'success': true, 'message': 'Login successful'};
  }
}
