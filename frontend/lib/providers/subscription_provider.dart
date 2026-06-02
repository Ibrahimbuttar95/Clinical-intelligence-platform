import 'package:flutter/material.dart';

class SubscriptionProvider
    extends ChangeNotifier {

  String currentPlan = "free";

  bool premium = false;

  void activatePlan(
      String planName) {

    currentPlan = planName;

    premium = true;

    notifyListeners();
  }
}
