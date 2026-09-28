import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

/// Horizontal padding shared by the scan result screens.
const scanResultPadding = EdgeInsets.fromLTRB(30, 20, 30, 24);

final scanSectionTitleStyle = AppTextStyles.bodyMedium.copyWith(
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

class ScanResultHeader extends StatelessWidget {
  final VoidCallback? onDownload;

  const ScanResultHeader({this.onDownload, super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text(
        'Scan Results',
        style: AppTextStyles.h4.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      const Spacer(),
      GestureDetector(
        onTap: onDownload,
        child: Row(
          children: [
            const Icon(
              Icons.file_download_outlined,
              size: 16,
              color: AppColors.primary,
            ),
            const SizedBox(width: 4),
            Text(
              'Download Report',
              style: AppTextStyles.caption.copyWith(
                fontSize: 11,
                color: AppColors.white,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class ScanSectionDivider extends StatelessWidget {
  const ScanSectionDivider({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 24),
    child: Container(
      height: 1,
      color: AppColors.primary.withValues(alpha: 0.3),
    ),
  );
}

/// "(Right)" / "(Left)" captions shown above the body figures.
class ScanSideLabels extends StatelessWidget {
  const ScanSideLabels({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.caption.copyWith(
      fontSize: 11,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
    );
    return SizedBox(
      height: 16,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(-0.56, 0),
            child: Text('(Right)', style: style),
          ),
          Align(
            alignment: const Alignment(0.56, 0),
            child: Text('(Left)', style: style),
          ),
        ],
      ),
    );
  }
}
