import 'package:jwt_decoder/jwt_decoder.dart';

class JwtManager {

  static bool valid(
      String token) {

    return !JwtDecoder
        .isExpired(token);
  }

  static Map<String, dynamic>
      payload(
          String token) {

    return JwtDecoder.decode(
      token,
    );
  }
}
