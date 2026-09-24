import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSettingsController extends GetxController {
  final nameController = TextEditingController(text: 'Josh Smith');
  final emailController = TextEditingController(text: 'josh@example.com');
  final phoneController = TextEditingController(text: '+1 234 567 890');
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final notificationsEnabled = true.obs;

  void saveProfile() => Get.back();
  void savePassword() => Get.back();
  void toggleNotifications(bool value) => notificationsEnabled.value = value;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
