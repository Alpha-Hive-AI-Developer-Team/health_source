import 'package:get/get.dart';
import '../../core/network/api_client.dart';
import '../../core/network/api_endpoints.dart';

/// Providers make the raw network calls only — no business logic, no
/// state. Repositories consume this and shape the result for the app.
class PatientProvider {
  final ApiClient _client = Get.find<ApiClient>();

  Future<List<dynamic>> fetchPatients() async {
    final response = await _client.get(ApiEndpoints.patients);
    return response.data['data'] as List<dynamic>;
  }
}
