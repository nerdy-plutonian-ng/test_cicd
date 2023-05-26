import 'package:flutter/material.dart';
import 'package:password_manager/data/auth_repo/auth_intf.dart';

class AuthState with ChangeNotifier {
  AuthState({required this.authRepo});

  final AuthRepo authRepo;

  String? email;
  String? password;

  bool get isAuthenticated {
    return authRepo.email == email && authRepo.password == password;
  }

  setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  setAuthenticated(bool isAuthenticated) {
    authRepo.isAuthenticated = isAuthenticated;
  }
}
