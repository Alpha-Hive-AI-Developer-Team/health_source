import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'patient_detail_widgets.dart';

class PatientDeleteDialog extends StatelessWidget {
  final VoidCallback onDelete;

  const PatientDeleteDialog({required this.onDelete, super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: Navigator.of(context).pop,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        color: Colors.black.withOpacity(0.35),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {},
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 300,
              padding: const EdgeInsets.fromLTRB(24, 36, 24, 24),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Remove Patient's\nRecord?",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h4.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'This will remove all info related\nto this patient permanently!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.caption.copyWith(
                      fontSize: 11,
                      height: 1.5,
                      color: AppColors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: PatientDialogButton(
                          label: 'Yes, Delete',
                          background: AppColors.primary,
                          onTap: onDelete,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: PatientDialogButton(
                          label: 'Cancel',
                          background: AppColors.surface,
                          onTap: Navigator.of(context).pop,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
