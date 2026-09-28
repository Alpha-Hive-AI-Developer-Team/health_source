import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_source/widgets/buttons/custom_primary_button.dart';
import 'package:health_source/widgets/dialogs/blurred_overlay.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class ExportReportSheet extends StatefulWidget {
  final ValueChanged<String> onDownload;

  const ExportReportSheet({required this.onDownload, super.key});

  static const fileTypes = ['PDF', 'CSV'];

  static void show({required ValueChanged<String> onDownload}) =>
      Get.bottomSheet(
        BlurredOverlay(
          color: AppColors.primary.withValues(alpha: 0.18),
          child: ExportReportSheet(onDownload: onDownload),
        ),
        isScrollControlled: true,
        barrierColor: Colors.transparent,
      );

  @override
  State<ExportReportSheet> createState() => _ExportReportSheetState();
}

class _ExportReportSheetState extends State<ExportReportSheet> {
  String? _fileType;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.fromLTRB(
      24,
      40,
      24,
      32 + MediaQuery.of(context).viewPadding.bottom,
    ),
    decoration: const BoxDecoration(
      color: AppColors.black,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Export Report File\nas?',
            textAlign: TextAlign.center,
            style: AppTextStyles.h4.copyWith(fontSize: 20, height: 1.4),
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'Specify file type',
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _fileType,
              isExpanded: true,
              dropdownColor: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.primary,
              ),
              hint: Text(
                'Select type',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 12,
                  color: AppColors.grey,
                ),
              ),
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 12,
                color: AppColors.black,
              ),
              items: ExportReportSheet.fileTypes
                  .map(
                    (type) => DropdownMenuItem(value: type, child: Text(type)),
                  )
                  .toList(),
              onChanged: (type) => setState(() => _fileType = type),
            ),
          ),
        ),
        const SizedBox(height: 50),
        CustomPrimaryButton(
          height: 48,
          label: 'Download',
          icon: Icons.file_download_outlined,
          onTap: _fileType == null
              ? null
              : () {
                  Get.back();
                  widget.onDownload(_fileType!);
                },
        ),
      ],
    ),
  );
}
