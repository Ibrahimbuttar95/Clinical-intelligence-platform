import '../storage/session_manager.dart';

class AppInitializer {

  static Future<void> initialize() async {

    final session =
        SessionManager();

    await session.getToken();
  }
}
