import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helpers {
  Helpers._();

  static void showSnackbar(String title, String message, {bool isError = false}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? Colors.redAccent : Colors.black87,
      colorText: Colors.white,
    );
  }
}
