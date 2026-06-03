import '../storage/session_manager.dart';

class AuthBootstrap {

  static Future<bool> isLoggedIn() async {

    final session =
        SessionManager();

    final token =
        await session.getToken();

    return token != null;
  }
}
