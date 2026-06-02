import '../core/api_client.dart';
import '../core/constants.dart';

class TriageService {

  final ApiClient _client =
      ApiClient();

  Future<dynamic> analyze(
      String symptoms) async {

    return await _client.post(
      "${AppConstants.apiBaseUrl}/api/triage",
      {
        "symptoms": symptoms,
      },
    );
  }
}
