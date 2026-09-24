import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      width: 68,
      height: 68,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.person_outline,
        color: AppColors.primary,
        size: 34,
      ),
    ),
  );
}
