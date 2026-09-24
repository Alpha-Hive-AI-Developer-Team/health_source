import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/text/custom_text.dart';

class SplashContinuePrompt extends StatelessWidget {
  final VoidCallback? onTap;

  const SplashContinuePrompt({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          const Icon(
            Icons.keyboard_arrow_up_rounded,
            color: AppColors.white,
            size: 25,
          ),
          const SizedBox(height: 3),
          CustomText(
            'SWIPE UP TO CONTINUE',
            style: AppTextStyles.caption,
            color: AppColors.white,
            fontSize: 9,
          ),
          const SizedBox(height: 13),
          Container(
            width: 24,
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
