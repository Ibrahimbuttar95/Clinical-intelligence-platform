import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? token;
  String? email;
  bool isLoggedIn = false;

  Future<void> login(
    String userEmail,
    String jwtToken,
  ) async {
    email = userEmail;
    token = jwtToken;
    isLoggedIn = true;

    notifyListeners();
  }

  void logout() {
    email = null;
    token = null;
    isLoggedIn = false;

    notifyListeners();
  }
}
