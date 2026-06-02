import 'package:flutter_tts/flutter_tts.dart';

class TTSEngine {

  final FlutterTts tts =
      FlutterTts();

  Future<void> speak(
      String text) async {

    await tts.speak(text);
  }

  Future<void> urdu() async {

    await tts.setLanguage(
      "ur-PK",
    );
  }

  Future<void> english() async {

    await tts.setLanguage(
      "en-US",
    );
  }
}
