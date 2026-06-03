import '../storage/preferences.dart';

class LanguageBootstrap {

  static Future<String> load() async {

    final prefs =
        Preferences();

    return await prefs.getLanguage();
  }
}
