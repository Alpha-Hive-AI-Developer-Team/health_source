import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class ScanViewSelector extends StatelessWidget {
  final String selectedView;
  final ValueChanged<String> onChanged;

  const ScanViewSelector({
    required this.selectedView,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
    height: 24,
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        _SelectorItem(
          label: 'Front View',
          selected: selectedView == 'Front View',
          onTap: () => onChanged('Front View'),
        ),
        _SelectorItem(
          label: 'Side View',
          selected: selectedView == 'Side View',
          onTap: () => onChanged('Side View'),
        ),
      ],
    ),
  );
}

class _SelectorItem extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SelectorItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: selected ? AppColors.white : AppColors.grey,
            fontSize: 8,
          ),
        ),
      ),
    ),
  );
}
