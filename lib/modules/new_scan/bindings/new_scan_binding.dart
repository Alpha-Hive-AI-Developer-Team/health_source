import 'package:get/get.dart';
import '../controllers/new_scan_controller.dart';

class NewScanBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<NewScanController>(() => NewScanController());
}
