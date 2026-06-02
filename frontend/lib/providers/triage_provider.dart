import 'package:flutter/material.dart';

class TriageProvider extends ChangeNotifier {

  String riskLevel = "";

  int riskScore = 0;

  String advice = "";

  void updateResult({
    required String level,
    required int score,
    required String clinicalAdvice,
  }) {

    riskLevel = level;

    riskScore = score;

    advice = clinicalAdvice;

    notifyListeners();
  }
}
