class SubscriptionResponse {

final String plan;

final bool active;

final String expiry;

SubscriptionResponse({
required this.plan,
required this.active,
required this.expiry,
});

factory SubscriptionResponse.fromJson(
Map<String, dynamic> json) {

return SubscriptionResponse(
  plan:
      json["plan"] ?? "free",

  active:
      json["active"] ?? false,

  expiry:
      json["expiry"] ?? "",
);

}
}
