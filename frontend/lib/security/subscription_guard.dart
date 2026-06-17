class SubscriptionGuard {

  static bool active(
      String plan) {

    return plan != "free";
  }
}
