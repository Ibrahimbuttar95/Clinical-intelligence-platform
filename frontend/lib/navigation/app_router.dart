import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/profile_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    "/": (context) => const HomeScreen(),
    "/login": (context) => const LoginScreen(),
    "/register": (context) => const RegisterScreen(),
    "/profile": (context) => const ProfileScreen(),
  };
}          const HomeScreen(),
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
