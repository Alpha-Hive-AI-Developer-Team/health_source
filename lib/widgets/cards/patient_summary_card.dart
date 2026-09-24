import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/patient_model.dart';

class PatientSummaryCard extends StatelessWidget {
  final PatientModel patient;
  final VoidCallback? onTap;

  const PatientSummaryCard({super.key, required this.patient, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 83,
          padding: const EdgeInsets.fromLTRB(12, 12, 10, 10),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      patient.name,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    'Last Scan: ${patient.lastScanLabel}',
                    style: AppTextStyles.caption.copyWith(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Text(
                '${patient.gender}, ${patient.age}y',
                style: AppTextStyles.caption.copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
