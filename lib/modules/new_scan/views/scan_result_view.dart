import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_source/core/constants/app_assets.dart';
import 'package:health_source/modules/new_scan/widgets/retake_button.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/patient_model.dart';
import '../controllers/new_scan_controller.dart';
import '../widgets/scan_result_common.dart';
import '../widgets/scan_summary_section.dart';

class ScanResultView extends GetView<NewScanController> {
  const ScanResultView({super.key});

  static const _issues = [
    'Spinal Misalignment or Poor Posture',
    'Pelvic Tilt or Hip Drop',
  ];

  @override
  Widget build(BuildContext context) {
    final patient =
        Get.arguments as PatientModel? ?? controller.selectedPatient.value;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: scanResultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScanResultHeader(onDownload: controller.openExportSheet),
              const SizedBox(height: 28),
              ScanSummarySection(
                title: 'General Info',
                rows: [
                  ('Name', patient?.name ?? 'Henry Cooper'),
                  ('Age', '${patient?.age ?? 46} y'),
                  ('Gender', patient?.gender ?? 'Male'),
                ],
              ),
              const ScanSectionDivider(),
              const ScanSummarySection(
                title: 'Movements  Selected:',
                rows: [
                  ('Jumping Jacks', 'Stable'),
                  ('Overhead squat', 'Erratic'),
                  ('Sample Movement', 'Stable'),
                ],
                valueColors: {
                  'Stable': AppColors.success,
                  'Erratic': AppColors.error,
                },
              ),
              const ScanSectionDivider(),
              Text('Joints Score', style: scanSectionTitleStyle),
              const SizedBox(height: 24),
              const ScanSideLabels(),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: controller.openDetailedResults,
                child: Image.asset(
                  AppAssets.human1,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const ScanSectionDivider(),
              Text('Issues Identified:', style: scanSectionTitleStyle),
              const SizedBox(height: 14),
              ..._issues.map(
                (issue) => Padding(
                  padding: const EdgeInsets.only(left: 6, bottom: 4),
                  child: Text(
                    '•  $issue',
                    style: AppTextStyles.bodyMedium.copyWith(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              RetakeScanButton(onPressed: controller.retakeScan),
            ],
          ),
        ),
      ),
    );
  }
}
