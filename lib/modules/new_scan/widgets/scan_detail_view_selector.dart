import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class ScanDetailViewSelector extends StatelessWidget {
  final String selectedView;
  final ValueChanged<String> onChanged;

  const ScanDetailViewSelector({
    required this.selectedView,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
    height: 36,
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Row(
      children: [
        Expanded(child: _buildTab('Front View')),
        Expanded(child: _buildTab('Side View')),
      ],
    ),
  );

  Widget _buildTab(String label) {
    final isSelected = selectedView == label;
    return GestureDetector(
      onTap: () => onChanged(label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: isSelected ? Colors.white : AppColors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
