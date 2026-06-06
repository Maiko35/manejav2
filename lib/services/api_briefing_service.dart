import 'package:maneja/core/network/api_client.dart';
import 'package:maneja/models/briefing.dart';

class ApiBriefingService {
  ApiBriefingService(this._client);

  final ApiClient _client;

  Future<Briefing> fetchBriefing() async {
    final json = await _client.getJson('/briefing/');
    return Briefing.fromJson(json);
  }
}
