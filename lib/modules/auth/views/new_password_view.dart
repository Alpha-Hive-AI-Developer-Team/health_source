import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/text/custom_text.dart';
import '../../../widgets/text_fields/custom_text_field.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_action_button.dart';
import '../widgets/auth_bottom_sheet.dart';

class NewPasswordView extends GetView<AuthController> {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBottomSheet(
      maxHeightFactor: .88,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppAssets.newPassword,
            height: 248,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 5),
          Center(
            child: CustomText(
              'Enter New Password',
              style: AppTextStyles.h3,
              
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: CustomText(
              'Set complex passwords to protect your account',
              style: AppTextStyles.bodySmall,
              fontSize: 14,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          CustomText(
            'Password',
            style: AppTextStyles.bodySmall,
            color: AppColors.white,
            fontSize: 14,
          ),
          const SizedBox(height: 5),
          CustomTextField(
            controller: controller.passwordController,
            hint: 'Enter your password',
            obscureText: true,
            prefixIcon: Icons.lock_outline_rounded,
            fillColor: AppColors.white,
            borderRadius: 7,
            iconSize: 13,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 11,
            ),
            textStyle: AppTextStyles.bodySmall.copyWith(
              color: AppColors.primaryDark,
              fontSize: 14,
            ),
            hintStyle: AppTextStyles.bodySmall.copyWith(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          CustomText(
            'Re Type Password',
            style: AppTextStyles.bodySmall,
            color: AppColors.white,
            fontSize: 14,
          ),
          const SizedBox(height: 5),
          CustomTextField(
            controller: controller.confirmPasswordController,
            hint: 'Enter your password',
            obscureText: true,
            prefixIcon: Icons.lock_outline_rounded,
            fillColor: AppColors.white,
            borderRadius: 7,
            iconSize: 13,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 11,
            ),
            textStyle: AppTextStyles.bodySmall.copyWith(
              color: AppColors.primaryDark,
              fontSize: 14,
            ),
            hintStyle: AppTextStyles.bodySmall.copyWith(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 17),
          AuthActionButton(
            label: 'Set New Password',
            onPressed: controller.saveNewPassword,
          ),
        ],
      ),
    );
  }
}
