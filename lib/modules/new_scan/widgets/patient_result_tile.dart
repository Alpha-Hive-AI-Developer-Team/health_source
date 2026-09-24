import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/patient_model.dart';

class PatientResultTile extends StatelessWidget {
  final PatientModel patient;
  final bool selected;
  final VoidCallback onTap;

  const PatientResultTile({
    required this.patient,
    required this.selected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(5),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      decoration: BoxDecoration(
        color: selected
            ? AppColors.primary.withValues(alpha: .16)
            : AppColors.surface,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: selected ? AppColors.primary : Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.surfaceElevated,
            child: Icon(
              Icons.person_outline,
              color: AppColors.primary,
              size: 14,
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Text(
              patient.name,
              style: AppTextStyles.bodyMedium.copyWith(fontSize: 9),
            ),
          ),
          if (selected)
            const Icon(Icons.check_circle, color: AppColors.primary, size: 14),
        ],
      ),
    ),
  );
}
