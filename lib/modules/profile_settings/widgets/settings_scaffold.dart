import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_source/core/constants/app_colors.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_text_styles.dart';

class SettingsScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? floatingActionButton;

  const SettingsScaffold({
    required this.title,
    required this.child,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.black,
    floatingActionButton: floatingActionButton,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsHeader(title),
            const SizedBox(height: 28),
            Expanded(child: SingleChildScrollView(child: child)),
          ],
        ),
      ),
    ),
  );
}

class SettingsHeader extends StatelessWidget {
  final String title;

  const SettingsHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      IconButton(
        onPressed: Get.back,
        icon: Image.asset(AppAssets.backIcon, width: 17, height: 17),
        padding: EdgeInsets.zero,
      ),
      const SizedBox(width: 8),
      Text(title, style: AppTextStyles.h4.copyWith(fontSize: 17)),
    ],
  );
}
