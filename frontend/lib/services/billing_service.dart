import '../core/api_client.dart';
import '../core/constants.dart';

class BillingService {

  final ApiClient _client =
      ApiClient();

  Future<dynamic> createPlan(
      String plan) async {

    return await _client.post(
      "${AppConstants.apiBaseUrl}/api/billing/create",
      {
        "plan": plan,
      },
    );
  }
}
