import 'tts_engine.dart';

class VoiceAssistant {

  final TTSEngine tts =
      TTSEngine();

  Future<void> speak(
      String text) async {

    await tts.speak(
      text,
    );
  }
}
