import '../services/history_service.dart';

class HistoryRepository {

  final HistoryService service =
      HistoryService();

  Future<dynamic> getHistory()
      async {

    return await service.getHistory();
  }
}
