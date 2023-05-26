import 'package:flutter/material.dart';
import 'package:password_manager/data/models/credential.dart';

class HomeState with ChangeNotifier {
  final List<Credential> _credentials = [];

  List<Credential> get credentials => _credentials;

  bool addCredential() {
    if (site == null || username == null || password == null) return false;
    _credentials
        .add(Credential(site: site!, username: username!, password: password!));
    notifyListeners();
    resetStage();
    return true;
  }

  removeCredential(int index) {
    _credentials.removeAt(index);
    notifyListeners();
  }

  bool updateCredential(
    int index,
  ) {
    _credentials[index] =
        Credential(site: site!, username: username!, password: password!);
    notifyListeners();
    return true;
  }

  clearCredentials() {
    _credentials.clear();
    notifyListeners();
  }

  ///working credentials
  String? site;
  String? username;
  String? password;

  setSite(String site) {
    this.site = site;
  }

  setUsername(String username) {
    this.username = username;
  }

  setPassword(String password) {
    this.password = password;
  }

  resetStage() {
    site = null;
    username = null;
    password = null;
  }

  setWorkingCredential(Credential credential) {
    site = credential.site;
    username = credential.username;
    password = credential.password;
  }
}
