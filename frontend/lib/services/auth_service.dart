import '../core/api_client.dart';
import '../core/constants.dart';

class AuthService {

  final ApiClient _client =
      ApiClient();

  Future<dynamic> login(
    String email,
    String password,
  ) async {

    return await _client.post(
      "${AppConstants.apiBaseUrl}/auth/login",
      {
        "email": email,
        "password": password,
      },
    );
  }

  Future<dynamic> register(
    String email,
    String password,
  ) async {

    return await _client.post(
      "${AppConstants.apiBaseUrl}/auth/register",
      {
        "email": email,
        "password": password,
      },
    );
  }
}
