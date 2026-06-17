import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {

  String? token;

  String? email;

  bool isLoggedIn = false;

  Future<void> login(
  String userEmail,
  String jwtToken,
) async {

  final session =
      SessionManager();

  await session.saveToken(
    jwtToken,
  );

  email = userEmail;

  token = jwtToken;

  isLoggedIn = true;

  notifyListeners();
  }

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
