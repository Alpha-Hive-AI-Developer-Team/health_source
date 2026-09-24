import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final obscurePassword = true.obs;
  final rememberMe = true.obs;
  final otpController = TextEditingController();
  final otpFocusNode = FocusNode();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // ── OTP resend timer ───────────────────────────────
  static const int _resendDuration = 180; // 3:00
  final resendSeconds = 0.obs;
  Timer? _resendTimer;

  /// "3:03" style label
  String get resendLabel {
    final s = resendSeconds.value;
    return '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';
  }

  void startResendTimer() {
    _resendTimer?.cancel();
    resendSeconds.value = _resendDuration;
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (resendSeconds.value <= 1) {
        resendSeconds.value = 0;
        t.cancel();
      } else {
        resendSeconds.value--;
      }
    });
  }

  void resendCode() {
    if (resendSeconds.value > 0) return;
    otpController.clear();
    // TODO: call your "resend code" API here
    startResendTimer();
  }

  void togglePasswordVisibility() => obscurePassword.toggle();
  void toggleRememberMe() => rememberMe.toggle();

  void signIn() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    Get.toNamed(AppRoutes.loginSuccess);
  }

  void openResetPassword() => Get.toNamed(AppRoutes.resetPassword);

  void sendVerificationCode() {
    startResendTimer(); // timer starts when the OTP screen opens
    Get.toNamed(AppRoutes.verifyEmail);
  }

  void verifyCode() => Get.toNamed(AppRoutes.loginSuccess);
  void openCreateAccount() => Get.toNamed(AppRoutes.createAccount);
  void continueCreateAccount() => Get.toNamed(AppRoutes.createAccountDetails);
  void createAccount() => Get.offNamed(AppRoutes.login);
  void saveNewPassword() => Get.toNamed(AppRoutes.loginSuccess);

  @override
  void onClose() {
    _resendTimer?.cancel();
    otpFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    otpController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
