import 'package:flutter/material.dart';

class ScanStepTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const ScanStepTitle({required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    ),
  );
}
