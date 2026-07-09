    import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/history_screen.dart';
import '../screens/triage_screen.dart';
import '../screens/subscription_screen.dart';
import '../screens/voice_screen.dart';
import '../screens/setting_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/report_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    "/": (context) => const HomeScreen(),
    "/login": (context) => const LoginScreen(),
    "/register": (context) => const RegisterScreen(),
    "/profile": (context) => const ProfileScreen(),
    "/history": (context) => const HistoryScreen(),
    "/triage": (context) => const TriageScreen(),
    "/subscription": (context) => const SubscriptionScreen(),
    "/voice": (context) => const VoiceScreen(),
    "/settings": (context) => const SettingsScreen(),
    "/onboarding": (context) => const OnboardingScreen(),
    "/report": (context) => const ReportScreen(),
  };
}
