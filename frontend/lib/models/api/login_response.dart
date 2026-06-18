class LoginResponse {

final String accessToken;

final String tokenType;

final String email;

final String plan;

LoginResponse({
required this.accessToken,
required this.tokenType,
required this.email,
required this.plan,
});

factory LoginResponse.fromJson(
Map<String, dynamic> json) {

return LoginResponse(
  accessToken:
      json["access_token"] ?? "",

  tokenType:
      json["token_type"] ?? "",

  email:
      json["email"] ?? "",

  plan:
      json["plan"] ?? "free",
);

}
}
