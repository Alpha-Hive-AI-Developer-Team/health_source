import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class ScanSummarySection extends StatelessWidget {
  final String title;
  final List<(String, String)> rows;
  final Color valueColor;

  const ScanSummarySection({
    required this.title,
    required this.rows,
    this.valueColor = AppColors.white,
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
          fontSize: 8,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 4),
      ...rows.map(
        (row) => Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  row.$1,
                  style: AppTextStyles.caption.copyWith(fontSize: 7),
                ),
              ),
              Text(
                row.$2,
                style: AppTextStyles.caption.copyWith(
                  color: valueColor,
                  fontSize: 7,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
