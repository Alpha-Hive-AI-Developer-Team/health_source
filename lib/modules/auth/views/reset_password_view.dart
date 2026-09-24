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

class ResetPasswordView extends GetView<AuthController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBottomSheet(
      maxHeightFactor: .86,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppAssets.resetPassword,
            height: 248,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 6),
          Center(
            child: CustomText(
              'Reset Your Password',
              style: AppTextStyles.h3,
            
            ),
          ),
          const SizedBox(height: 9),
          Center(
            child: CustomText(
              'Enter your email address below\nand we\'ll send you a link with instructions',
              style: AppTextStyles.bodySmall,
              fontSize: 12,
              
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 22),
          CustomText(
            'Email Address',
            style: AppTextStyles.bodySmall,
            color: AppColors.white,
        
          ),
          const SizedBox(height: 5),
          CustomTextField(
            controller: controller.emailController,
            hint: 'Enter Email Address',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.alternate_email_rounded,
            fillColor: AppColors.white,
            borderRadius: 7,
            iconSize: 13,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 11,
            ),
            textStyle: AppTextStyles.bodySmall.copyWith(
              color: AppColors.primaryDark,
              fontSize: 15,
            ),
            hintStyle: AppTextStyles.bodySmall.copyWith(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          AuthActionButton(
            label: 'Send Verification Code',
            onPressed: controller.sendVerificationCode,
          ),
        ],
      ),
    );
  }
}
