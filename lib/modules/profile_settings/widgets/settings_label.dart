import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class SettingsLabel extends StatelessWidget {
  final String text;

  const SettingsLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(
      text,
      style: AppTextStyles.bodySmall.copyWith(
        color: AppColors.white,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
