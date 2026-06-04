class HistoryModel {

  final String symptoms;

  final String riskLevel;

  final String date;

  HistoryModel({
    required this.symptoms,
    required this.riskLevel,
    required this.date,
  });

  factory HistoryModel.fromJson(
      Map<String, dynamic> json) {

    return HistoryModel(
      symptoms:
          json["symptoms"] ?? "",

      riskLevel:
          json["risk_level"] ?? "",

      date:
          json["date"] ?? "",
    );
  }
}
