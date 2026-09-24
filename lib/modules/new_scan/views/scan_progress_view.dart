import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../controllers/new_scan_controller.dart';
import '../widgets/scan_step_scaffold.dart';

class ScanProgressView extends GetView<NewScanController> {
  const ScanProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!controller.isScanning.value) controller.startScan();
    return ScanStepScaffold(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              width: 190,
              height: 250,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 155,
                    height: 155,
                    child: CircularProgressIndicator(
                      value: controller.progress.value,
                      strokeWidth: 7,
                      color: AppColors.primary,
                      backgroundColor: AppColors.divider,
                    ),
                  ),
                  const Icon(
                    Icons.accessibility_new,
                    color: AppColors.primary,
                    size: 115,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'Analyzing your scan...',
              style: AppTextStyles.h4.copyWith(fontSize: 17),
            ),
            const SizedBox(height: 10),
            Text(
              '${(controller.progress.value * 100).round()}% complete',
              style: AppTextStyles.bodySmall.copyWith(fontSize: 12),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
