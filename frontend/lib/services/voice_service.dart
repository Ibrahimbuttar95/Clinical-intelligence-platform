import '../core/api_client.dart';
import '../core/constants.dart';

class VoiceService {

  final ApiClient _client =
      ApiClient();

  Future<dynamic> processVoice(
      String text) async {

    return await _client.post(
      "${AppConstants.apiBaseUrl}/api/voice",
      {
        "text": text,
      },
    );
  }
}
