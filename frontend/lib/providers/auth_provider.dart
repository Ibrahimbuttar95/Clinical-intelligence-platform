import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/history_screen.dart';
import '../screens/triage_screen.dart';
import '../screens/subscription_screen.dart';
import '../screens/voice_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/report_screen.dart';

class AppRouter {

static Route<dynamic> generate(
RouteSettings settings) {

switch (settings.name) {

  case "/login":
    return MaterialPageRoute(
      builder: (_) =>
          const LoginScreen(),
    );

  case "/register":
    return MaterialPageRoute(
      builder: (_) =>
          const RegisterScreen(),
    );

  case "/home":
    return MaterialPageRoute(
      builder: (_) =>
          const HomeScreen(),
    );

  case "/profile":
    return MaterialPageRoute(
      builder: (_) =>
          const ProfileScreen(),
    );

  case "/history":
    return MaterialPageRoute(
      builder: (_) =>
          const HistoryScreen(),
    );

  case "/triage":
    return MaterialPageRoute(
      builder: (_) =>
          const TriageScreen(),
    );

  case "/subscription":
    return MaterialPageRoute(
      builder: (_) =>
          const SubscriptionScreen(),
    );

  case "/voice":
    return MaterialPageRoute(
      builder: (_) =>
          const VoiceScreen(),
    );

  case "/settings":
    return MaterialPageRoute(
      builder: (_) =>
          const SettingsScreen(),
    );

  case "/onboarding":
    return MaterialPageRoute(
      builder: (_) =>
          const OnboardingScreen(),
    );

  case "/report":
    return MaterialPageRoute(
      builder: (_) =>
          const ReportScreen(),
    );

  default:
    return MaterialPageRoute(
      builder: (_) =>
          const LoginScreen(),
    );
}

}
}
