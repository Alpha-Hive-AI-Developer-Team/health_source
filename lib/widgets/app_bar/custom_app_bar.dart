import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_text_styles.dart';

/// App-wide app bar. Implements PreferredSizeWidget so it drops straight
/// into Scaffold(appBar: ...). Supports back button, title and trailing actions.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBack;
  final List<Widget>? actions;
  final Widget? leading;
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.showBack = true,
    this.actions,
    this.leading,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: AppSizes.md,
      leading: leading ??
          (showBack
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: AppSizes.iconSm),
                  onPressed: () => Navigator.of(context).maybePop(),
                )
              : null),
      title: title != null ? Text(title!, style: AppTextStyles.h4) : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarHeight);
}
