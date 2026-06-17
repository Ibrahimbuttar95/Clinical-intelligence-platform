import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'providers/language_provider.dart';
import 'providers/subscription_provider.dart';
import 'providers/triage_provider.dart';

import 'screens/splash_screen.dart';

void main() {
runApp(
const ClinicalIntelligenceApp(),
);
}

class ClinicalIntelligenceApp extends StatelessWidget {
const ClinicalIntelligenceApp({
super.key,
});

@override
Widget build(BuildContext context) {

return MultiProvider(

  providers: [

    ChangeNotifierProvider(
      create: (_) =>
          AuthProvider(),
    ),

    ChangeNotifierProvider(
      create: (_) =>
          LanguageProvider(),
    ),

    ChangeNotifierProvider(
      create: (_) =>
          SubscriptionProvider(),
    ),

    ChangeNotifierProvider(
      create: (_) =>
          TriageProvider(),
    ),
  ],

  child: MaterialApp(

    title:
        'Clinical Intelligence Platform',

    debugShowCheckedModeBanner:
        false,

    theme: ThemeData(
      useMaterial3: true,
    ),

    home:
        const SplashScreen(),
  ),
);

}
}
