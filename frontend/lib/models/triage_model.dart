class TriageModel {

  final String riskLevel;

  final int riskScore;

  final String advice;

  TriageModel({
    required this.riskLevel,
    required this.riskScore,
    required this.advice,
  });

  factory TriageModel.fromJson(
      Map<String, dynamic> json) {

    return TriageModel(
      riskLevel:
          json["risk_level"] ?? "",
      riskScore:
          json["risk_score"] ?? 0,
      advice:
          json["advice"] ?? "",
    );
  }
}
