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

class CreateAccountView extends GetView<AuthController> {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBottomSheet(
      maxHeightFactor: .93,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppAssets.login_icon,
            height: 85,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 7),
          Center(
            child: CustomText(
              'Create Your Account',
              style: AppTextStyles.h3,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: CustomText(
              'Create account for exploring news',
              style: AppTextStyles.bodySmall,
              fontSize: 14,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 18),
          Image.asset(
            AppAssets.create_account,
            height: 112,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 12),
          CustomText(
            'Email',
            style: AppTextStyles.bodySmall,
            color: AppColors.white,
            fontSize: 14,
          ),
          const SizedBox(height: 5),
          CustomTextField(
            controller: controller.emailController,
            hint: 'Hello@tyler.com',
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
              fontSize: 14,
            ),
            hintStyle: AppTextStyles.bodySmall.copyWith(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          AuthActionButton(
            label: 'Continue',
            onPressed: controller.continueCreateAccount,
          ),
        ],
      ),
    );
  }
}
