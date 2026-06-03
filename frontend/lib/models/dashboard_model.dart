class DashboardModel {

  final int assessments;

  final int riskAlerts;

  final bool premium;

  DashboardModel({
    required this.assessments,
    required this.riskAlerts,
    required this.premium,
  });

  factory DashboardModel.fromJson(
      Map<String, dynamic> json) {

    return DashboardModel(
      assessments:
          json["assessments"] ?? 0,
      riskAlerts:
          json["risk_alerts"] ?? 0,
      premium:
          json["premium"] ?? false,
    );
  }
}
