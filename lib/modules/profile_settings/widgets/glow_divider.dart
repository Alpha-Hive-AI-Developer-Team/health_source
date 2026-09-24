import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class GlowDivider extends StatelessWidget {
  const GlowDivider({super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: 7,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primary.withOpacity(0.0),
          AppColors.primary.withOpacity(0.18),
          AppColors.primary.withOpacity(0.0),
        ],
      ),
    ),
  );
}
