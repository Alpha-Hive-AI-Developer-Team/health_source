import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/text/custom_text.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.grey, height: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomText(
            'or continue with',
            style: AppTextStyles.bodySmall,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Expanded(child: Divider(color: AppColors.grey, height: 2.5)),
      ],
    );
  }
}
