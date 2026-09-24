import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class ScanMeasurements extends StatelessWidget {
  final bool sideView;

  const ScanMeasurements({required this.sideView, super.key});

  @override
  Widget build(BuildContext context) {
    final rows = sideView
        ? const [
            ('Head tilt', '2°'),
            ('Shoulder', '1°'),
            ('Spine curve', 'Good'),
            ('Hip alignment', '3°'),
            ('Knee bend', 'Normal'),
            ('Foot angle', '4°'),
          ]
        : const [
            ('Head tilt', '1°'),
            ('Shoulder level', 'Good'),
            ('Spine alignment', 'Good'),
            ('Hip balance', '2°'),
            ('Knee position', 'Normal'),
            ('Foot balance', 'Good'),
          ];

    return Column(
      children: rows
          .map(
            (row) => Padding(
              padding: const EdgeInsets.only(bottom: 3),
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
                      color: row.$2 == 'Good' || row.$2 == 'Normal'
                          ? AppColors.success
                          : AppColors.warning,
                      fontSize: 7,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
