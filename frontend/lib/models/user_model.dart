class UserModel {

  final String email;

  final String tier;

  UserModel({
    required this.email,
    required this.tier,
  });

  factory UserModel.fromJson(
      Map<String, dynamic> json) {

    return UserModel(
      email: json["email"] ?? "",
      tier: json["tier"] ?? "free",
    );
  }
}
