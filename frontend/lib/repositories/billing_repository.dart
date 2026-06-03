import '../services/billing_service.dart';

class BillingRepository {

  final BillingService _service =
      BillingService();

  Future<dynamic> createPlan(
      String plan) async {

    return await _service.createPlan(
      plan,
    );
  }
}
