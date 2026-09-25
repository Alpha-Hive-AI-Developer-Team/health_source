import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class ScanSearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const ScanSearchField({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) => TextField(
    onChanged: onChanged,
    style: AppTextStyles.bodySmall.copyWith(
      color: AppColors.primaryDark,
      fontSize: 13,
    ),
    decoration: InputDecoration(
      hintText: 'Search name here',
      hintStyle: AppTextStyles.bodySmall.copyWith(
        color: AppColors.grey,
        fontSize: 13,
      ),
      suffixIcon: const Icon(Icons.search, color: AppColors.grey, size: 13),
      suffixIconConstraints: const BoxConstraints(minWidth: 28),
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
