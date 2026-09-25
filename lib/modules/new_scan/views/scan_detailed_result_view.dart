import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_source/core/constants/app_assets.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/patient_model.dart';
import '../controllers/new_scan_controller.dart';
import '../widgets/labelled_body_image.dart';
import '../widgets/retake_button.dart';
import '../widgets/scan_detail_view_selector.dart';
import '../widgets/scan_result_common.dart';
import '../widgets/scan_summary_section.dart';

class ScanDetailedResultView extends GetView<NewScanController> {
  const ScanDetailedResultView({super.key});

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
              Text(
                'Select a view to see detailed score:',
                style: scanSectionTitleStyle,
              ),
              const SizedBox(height: 14),
              Obx(
                () => ScanDetailViewSelector(
                  selectedView: controller.selectedDetailView.value,
                  onChanged: controller.selectDetailView,
                ),
              ),
              const SizedBox(height: 24),
              const ScanSideLabels(),
              const SizedBox(height: 12),
              Obx(
                () => controller.selectedDetailView.value == 'Front View'
                    ? const _FrontViewContent()
                    : const _SideViewContent(),
              ),
              const SizedBox(height: 28),
              RetakeScanButton(onPressed: controller.retakeScan),
            ],
          ),
        ),
      ),
    );
  }
}

class _FrontViewContent extends StatelessWidget {
  const _FrontViewContent();

  // Label positions line up with the joint bands drawn in the image.
  @override
  Widget build(BuildContext context) => const LabelledBodyImage(
    asset: AppAssets.humanside1,
    aspectRatio: 948 / 922,
    showGuideLines: true,
    labels: [
      BodyImageLabel('Head', 0.133),
      BodyImageLabel('Shoulders', 0.266),
      BodyImageLabel('Spine', 0.403),
      BodyImageLabel('Hips', 0.530),
      BodyImageLabel('Knees', 0.670),
      BodyImageLabel('Ankles', 0.833),
    ],
  );
}

class _SideViewContent extends StatelessWidget {
  const _SideViewContent();

  // Label positions sit just above the measurements drawn in the image.
  @override
  Widget build(BuildContext context) => const LabelledBodyImage(
    asset: AppAssets.humanside2,
    aspectRatio: 885 / 937,
    mirrorLabels: true,
    labels: [
      BodyImageLabel('Head', 0.162),
      BodyImageLabel('Shoulder', 0.309),
      BodyImageLabel('Spine', 0.450),
      BodyImageLabel('Hip', 0.586),
      BodyImageLabel('Right Knee', 0.745),
    ],
  );
}
