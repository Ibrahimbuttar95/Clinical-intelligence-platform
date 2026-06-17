import '../core/api_client.dart';
import '../core/constants.dart';

class HistoryService {

  final ApiClient client =
      ApiClient();

  Future<dynamic> getHistory()
      async {

    return await client.post(
      "${AppConstants.apiBaseUrl}/api/history",
      {},
    );
  }
}
