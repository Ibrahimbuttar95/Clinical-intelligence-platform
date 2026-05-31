import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const ClinicalApp());
}

class ClinicalApp extends StatelessWidget {
  const ClinicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clinical Intelligence',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
