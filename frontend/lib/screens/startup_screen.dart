import 'package:flutter/material.dart';

import '../bootstrap/auth_bootstrap.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class StartupScreen
    extends StatefulWidget {

  const StartupScreen({
    super.key,
  });

  @override
  State<StartupScreen>
      createState() =>
          _StartupScreenState();
}

class _StartupScreenState
    extends State<StartupScreen> {

  @override
  void initState() {

    super.initState();

    check();
  }

  Future<void> check() async {

    final loggedIn =
        await AuthBootstrap
            .isLoggedIn();

    if (!mounted) return;

    Navigator.pushReplacement(
      context,

      MaterialPageRoute(
        builder: (_) =>
            loggedIn
                ? const HomeScreen()
                : const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(
      BuildContext context) {

    return const Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(),
      ),
    );
  }
}
