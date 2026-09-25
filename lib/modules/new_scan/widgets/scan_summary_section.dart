import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class ScanSummarySection extends StatelessWidget {
  final String title;
  final List<(String, String)> rows;
  final Map<String, Color> valueColors;

  const ScanSummarySection({
    required this.title,
    required this.rows,
    this.valueColors = const {},
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 8),
      ...rows.map(
        (row) => Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  row.$1,
                  style: AppTextStyles.caption.copyWith(fontSize: 11, color: AppColors.white),
                ),
              ),
              Text(
                row.$2,
                style: AppTextStyles.caption.copyWith(
                  color: valueColors[row.$2] ?? AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
