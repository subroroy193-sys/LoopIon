class AuthContext {
  const AuthContext({this.role = 'user', this.isAuthenticated = false});

  final String role;
  final bool isAuthenticated;

  AuthContext copyWith({String? role, bool? isAuthenticated}) {
    return AuthContext(
      role: role ?? this.role,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
