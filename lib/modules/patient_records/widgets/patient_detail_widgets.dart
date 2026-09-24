import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class PatientDetailSectionTitle extends StatelessWidget {
  final String text;

  const PatientDetailSectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: AppTextStyles.bodySmall.copyWith(
        color: AppColors.primary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

class PatientInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const PatientInfoRow(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.white,
              fontSize: 14,
            ),
          ),
        ),
        Text(
          value,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

class PatientScanRow extends StatelessWidget {
  final String date;

  const PatientScanRow({required this.date, super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: 38,
    padding: const EdgeInsets.symmetric(horizontal: 11),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(7),
    ),
    child: Row(
      children: [
        const Icon(Icons.event_note_outlined, color: AppColors.white, size: 16),
        const SizedBox(width: 6),
        Text(
          date,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.white,
            fontSize: 11,
          ),
        ),
        const Spacer(),
        Text(
          'View details',
          style: AppTextStyles.caption.copyWith(
            color: AppColors.white,
            fontSize: 10,
          ),
        ),
        const Icon(Icons.arrow_outward, color: AppColors.white, size: 13),
      ],
    ),
  );
}

class PatientDetailMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const PatientDetailMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 17),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.white,
              fontSize: 11,
            ),
          ),
        ],
      ),
    ),
  );
}

class PatientDialogButton extends StatelessWidget {
  final String label;
  final Color background;
  final VoidCallback onTap;

  const PatientDialogButton({
    required this.label,
    required this.background,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 46,
    child: Material(
      color: background,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
