import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'providers/language_provider.dart';
import 'providers/subscription_provider.dart';
import 'providers/triage_provider.dart';
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
    return MaterialApp(
      title: 'Clinical Intelligence Platform',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
      ),

      home: const SplashScreen(),
    );
  }
}
