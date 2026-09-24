import 'package:get/get.dart';
import '../network/api_client.dart';
import '../services/storage_service.dart';

/// App-wide singletons that must exist before any screen loads
/// (network client, local storage, etc). Registered once in main().
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StorageService(), permanent: true);
    Get.put(ApiClient(), permanent: true);
  }
}
