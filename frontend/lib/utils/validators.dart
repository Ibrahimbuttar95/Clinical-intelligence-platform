class Validators {

  static String? email(String value) {

    if (!value.contains("@")) {
      return "Invalid email";
    }

    return null;
  }

  static String? password(
      String value) {

    if (value.length < 8) {
      return "Password too short";
    }

    return null;
  }
}
