class RiskUtils {

  static String classify(
      int score) {

    if (score < 30) {
      return "Low";
    }

    if (score < 70) {
      return "Moderate";
    }

    return "High";
  }
}
