import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_text_styles.dart';
import '../buttons/custom_gradient_button.dart';
import '../buttons/custom_outline_button.dart';

/// Central confirm/alert dialog. Call `CustomDialog.show(...)` via Get so
/// it works from a controller with no BuildContext on hand.
class CustomDialog {
  static Future<void> show({
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    VoidCallback? onConfirm,
    bool showCancel = true,
  }) {
    return Get.dialog(
      Dialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusLg)),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.h4),
              const SizedBox(height: AppSizes.sm),
              Text(message, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: AppSizes.lg),
              Row(
                children: [
                  if (showCancel) ...[
                    Expanded(child: CustomOutlineButton(label: cancelLabel, onTap: () => Get.back())),
                    const SizedBox(width: AppSizes.sm),
                  ],
                  Expanded(
                    child: CustomGradientButton(
                      label: confirmLabel,
                      onTap: () {
                        Get.back();
                        onConfirm?.call();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
