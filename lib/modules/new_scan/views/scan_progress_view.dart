import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_source/widgets/buttons/custom_primary_button.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../controllers/new_scan_controller.dart';
import '../widgets/scan_camera_frame.dart';
import '../widgets/scan_dots_loader.dart';

class ScanProgressView extends GetView<NewScanController> {
  const ScanProgressView({super.key});

  @override
  Widget build(BuildContext context) => PopScope(
    onPopInvokedWithResult: (didPop, _) {
      if (didPop) controller.cancelScan();
    },
    child: Scaffold(
      backgroundColor: AppColors.black,
      body: Obx(
        () => Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 24),
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Movement:  ',
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '“${controller.currentMovement}”',
                            style: AppTextStyles.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      controller.isMovementComplete.value
                          ? 'Scan Complete!'
                          : 'Hold',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Expanded(child: ScanCameraFrame()),
                    const SizedBox(height: 40),
                    CustomPrimaryButton(
                      height: 40,
                      label: controller.isLastMovement
                          ? 'End Scan'
                          : 'Next Movement',
                      onTap: !controller.isMovementComplete.value
                          ? null
                          : controller.isLastMovement
                          ? controller.endScan
                          : controller.nextMovement,
                    ),
                  ],
                ),
              ),
            ),
            if (controller.isGeneratingReport.value)
              const Positioned.fill(child: _GeneratingReportOverlay()),
          ],
        ),
      ),
    ),
  );
}

class _GeneratingReportOverlay extends StatelessWidget {
  const _GeneratingReportOverlay();

  @override
  Widget build(BuildContext context) => BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
    child: ColoredBox(
      color: AppColors.primary.withValues(alpha: 0.12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ScanDotsLoader(),
          const SizedBox(height: 28),
          Text('Hold on!', style: AppTextStyles.h4.copyWith(fontSize: 16)),
          const SizedBox(height: 4),
          Text(
            'We are generating report for you',
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    ),
  );
}
