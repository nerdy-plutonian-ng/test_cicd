import 'package:password_manager/data/auth_repo/auth_intf.dart';

class MemoryAuth implements AuthRepo {
  @override
  var isAuthenticated = false;

  @override
  String email = 'jonsnow@thewatch.com';
  @override
  String password = 'ygritte';

  MemoryAuth._() {
    _instance = this;
  }

  static MemoryAuth? _instance;

  static MemoryAuth get instance {
    _instance ??= MemoryAuth._();
    return _instance!;
  }

  @override
  Future<bool> login(String email, String password) async {
    if (email == this.email && password == this.password) {
      isAuthenticated = true;
      return true;
    }
    return false;
  }

  @override
  Future<bool> logout() async {
    isAuthenticated = false;
    return true;
  }
}
