class TriageResponse {

final String riskLevel;

final int riskScore;

final String recommendation;

final List<dynamic> alerts;

TriageResponse({
required this.riskLevel,
required this.riskScore,
required this.recommendation,
required this.alerts,
});

factory TriageResponse.fromJson(
Map<String, dynamic> json) {

return TriageResponse(
  riskLevel:
      json["risk_level"] ?? "",

  riskScore:
      json["risk_score"] ?? 0,

  recommendation:
      json["recommendation"] ?? "",

  alerts:
      json["alerts"] ?? [],
);

}
}
