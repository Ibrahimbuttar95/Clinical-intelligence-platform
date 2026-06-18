import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {

static const FlutterSecureStorage
_storage =
FlutterSecureStorage();

Future<void> saveToken(
String token) async {

await _storage.write(
  key: "jwt_token",
  value: token,
);

}

Future<String?> getToken()
async {

return await _storage.read(
  key: "jwt_token",
);

}

Future<void> saveRefreshToken(
String token) async {

await _storage.write(
  key: "refresh_token",
  value: token,
);

}

Future<String?> getRefreshToken()
async {

return await _storage.read(
  key: "refresh_token",
);

}

Future<void> saveUserEmail(
String email) async {

await _storage.write(
  key: "user_email",
  value: email,
);

}

Future<String?> getUserEmail()
async {

return await _storage.read(
  key: "user_email",
);

}

Future<void> clearAll()
async {

await _storage.deleteAll();

}
}
