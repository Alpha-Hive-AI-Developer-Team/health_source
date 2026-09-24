import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/patient_model.dart';
import '../controllers/new_scan_controller.dart';
import '../widgets/body_scan_figure.dart';
import '../widgets/scan_measurements.dart';
import '../widgets/scan_step_scaffold.dart';
import '../widgets/scan_step_button.dart';
import '../widgets/scan_summary_section.dart';
import '../widgets/scan_view_selector.dart';

class ScanResultView extends GetView<NewScanController> {
  const ScanResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final patient =
        Get.arguments as PatientModel? ?? controller.selectedPatient.value;
    return ScanStepScaffold(
      child: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Scan Results',
                    style: AppTextStyles.h4.copyWith(fontSize: 12),
                  ),
                  const Spacer(),
                  const Icon(Icons.download_outlined, size: 9),
                  const SizedBox(width: 2),
                  Text(
                    'Download Report',
                    style: AppTextStyles.caption.copyWith(fontSize: 6),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ScanSummarySection(
                title: 'General Info',
                rows: [
                  ('Name', patient?.name ?? 'Harry Cooper'),
                  ('Age', '${patient?.age ?? 46} y'),
                  ('Gender', patient?.gender ?? 'Male'),
                ],
              ),
              const SizedBox(height: 10),
              ScanSummarySection(
                title: 'Movements Selected',
                rows: const [
                  ('Jumping jacks', 'Stable'),
                  ('Overhead squat', 'Stable'),
                  ('Sample movement', 'Stable'),
                ],
                valueColor: AppColors.success,
              ),
              const SizedBox(height: 11),
              Text(
                'Joint Score',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 132,
                    child: BodyScanFigure(
                      sideView:
                          controller.selectedResultView.value == 'Side View',
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: ScanMeasurements(
                      sideView:
                          controller.selectedResultView.value == 'Side View',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                'Select a view to see detailed scan:',
                style: AppTextStyles.caption.copyWith(fontSize: 8),
              ),
              const SizedBox(height: 4),
              ScanViewSelector(
                selectedView: controller.selectedResultView.value,
                onChanged: controller.selectResultView,
              ),
              const SizedBox(height: 10),
              Text(
                'Issues Identified:',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '• Spinal level: Moderate Poor Posture\n• Pelvic tilt: 18° Hip Drop',
                style: AppTextStyles.caption.copyWith(
                  fontSize: 7,
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 12),
              ScanStepButton(
                label: 'Retake Scan',
                onPressed: controller.retakeScan,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
