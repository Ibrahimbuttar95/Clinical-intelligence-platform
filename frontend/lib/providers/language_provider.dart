import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {

  String currentLanguage = "en";

  void switchLanguage(
      String languageCode) {

    currentLanguage = languageCode;

    notifyListeners();
  }
}
