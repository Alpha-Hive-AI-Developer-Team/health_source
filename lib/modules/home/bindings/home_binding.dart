import 'package:get/get.dart';
import '../controllers/home_controller.dart';

/// Lazily instantiates HomeController only when HomeView is pushed,
/// and disposes it when popped. One binding per module.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
