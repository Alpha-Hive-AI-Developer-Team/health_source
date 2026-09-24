import 'package:flutter/material.dart';

import '../../../core/theme/app_text_styles.dart';

class HelpTile extends StatelessWidget {
  final String text;

  const HelpTile(this.text, {super.key});

  @override
  Widget build(BuildContext context) => ExpansionTile(
    tilePadding: EdgeInsets.zero,
    title: Text(text, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          'You can manage this option from your HealthSource account.',
          style: AppTextStyles.bodySmall.copyWith(fontSize: 11),
        ),
      ),
    ],
  );
}
