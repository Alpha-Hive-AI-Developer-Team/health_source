import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';

class SplashController extends GetxController {
  final hasMovedForward = false.obs;

  void continueToLogin() {
    if (hasMovedForward.value) return;
    hasMovedForward.value = true;
    Get.offNamed(AppRoutes.login);
  }
}
