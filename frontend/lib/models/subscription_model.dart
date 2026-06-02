class SubscriptionModel {

  final String plan;

  final int amount;

  SubscriptionModel({
    required this.plan,
    required this.amount,
  });

  factory SubscriptionModel.fromJson(
      Map<String, dynamic> json) {

    return SubscriptionModel(
      plan: json["plan"] ?? "",
      amount: json["amount"] ?? 0,
    );
  }
}
