abstract class AuthRepo {
  late bool isAuthenticated;
  late final String email;
  late final String password;

  Future<bool> login(String email, String password);
  Future<bool> logout();
}
