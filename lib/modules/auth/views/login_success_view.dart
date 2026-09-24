import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/text/custom_text.dart';
import '../widgets/auth_action_button.dart';
import '../widgets/auth_bottom_sheet.dart';

class LoginSuccessView extends GetView {
  const LoginSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBottomSheet(
      maxHeightFactor: .72,
      child: Column(
        children: [
          Image.asset(AppAssets.loginSuccess, height: 170, fit: BoxFit.contain),
          const SizedBox(height: 8),
          CustomText(
            'Yey! Login Successful',
            style: AppTextStyles.h3,
            fontSize: 15,
          ),
          const SizedBox(height: 8),
          CustomText(
            'You will be moved to home screen right now.',
            style: AppTextStyles.bodySmall,
            fontSize: 7,
            textAlign: TextAlign.center,
          ),
          CustomText(
            'Enjoy the features!',
            style: AppTextStyles.bodySmall,
            fontSize: 7,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 21),
          AuthActionButton(
            label: "Let's Explore",
            onPressed: () => Get.offAllNamed(AppRoutes.home),
          ),
        ],
      ),
    );
  }
}
