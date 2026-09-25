import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ScanStepScaffold extends StatelessWidget {
  final Widget child;

  const ScanStepScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.primaryDark,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 140, 3, 0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(11, 18, 11, 14),
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
        ),
      ),
    ),
  );
}
