import 'package:speech_to_text/speech_to_text.dart';
class SpeechEngine {
final SpeechToText speech = SpeechToText();
Future initialize() async {
return await speech.initialize();
}
Future startListening( Function(String) onResult) async {
await speech.listen(
  onResult: (result) {

    onResult(
      result.recognizedWords,
    );
  },
);
}
Future stopListening() async {
await speech.stop();
} }
