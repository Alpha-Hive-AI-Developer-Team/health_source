import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'scan_result_common.dart';

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
  Widget build(BuildContext context) {
    final rowStyle = AppTextStyles.bodyMedium.copyWith(fontSize: 13);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: scanSectionTitleStyle),
        const SizedBox(height: 16),
        ...rows.map(
          (row) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Expanded(child: Text(row.$1, style: rowStyle)),
                Text(
                  row.$2,
                  style: rowStyle.copyWith(
                    color: valueColors[row.$2] ?? AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
