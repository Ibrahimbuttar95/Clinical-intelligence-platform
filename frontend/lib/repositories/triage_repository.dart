import '../services/triage_service.dart';

class TriageRepository {

  final TriageService _service =
      TriageService();

  Future<dynamic> analyze(
      String symptoms) async {

    return await _service.analyze(
      symptoms,
    );
  }
}
