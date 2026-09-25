import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class ScanInstruction extends StatelessWidget {
  final int number;
  final String text;

  const ScanInstruction({required this.number, required this.text, super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number. ',
          style: AppTextStyles.caption.copyWith(
            
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(text, style: AppTextStyles.caption.copyWith(fontSize: 14)),
        ),
      ],
    ),
  );
}
