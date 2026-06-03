import '../core/api_client.dart';
import '../core/constants.dart';

class HistoryRepository {

  final ApiClient _client =
      ApiClient();

  Future<dynamic> getHistory() async {

    return await _client.post(
      "${AppConstants.apiBaseUrl}/api/history",
      {},
    );
  }
}
