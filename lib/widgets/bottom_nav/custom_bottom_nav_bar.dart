import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_text_styles.dart';

class NavItemData {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const NavItemData({required this.icon, required this.activeIcon, required this.label});
}

/// Bottom nav for the 4 primary tabs: Home, Records, New Scan, Profile.
/// Drive `currentIndex` from a GetX controller's Obx so it stays reactive.
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<NavItemData> items;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.bottomNavHeight,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLg)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final selected = i == currentIndex;
          final item = items[i];
          return GestureDetector(
            onTap: () => onTap(i),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  selected ? item.activeIcon : item.icon,
                  color: selected ? AppColors.primary : AppColors.grey,
                  size: AppSizes.iconMd,
                ),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: AppTextStyles.caption.copyWith(
                    color: selected ? AppColors.primary : AppColors.grey,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
