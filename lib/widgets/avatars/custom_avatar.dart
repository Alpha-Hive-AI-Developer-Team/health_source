import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

/// Circular avatar with graceful fallback to initials when no image is
/// available. Used in patient cards, profile header, app bar.
class CustomAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final double size;
  final Color borderColor;
  final bool showBorder;

  const CustomAvatar({
    super.key,
    this.imageUrl,
    this.name,
    this.size = 48,
    this.borderColor = AppColors.primary,
    this.showBorder = false,
  });

  String get _initials {
    if (name == null || name!.trim().isEmpty) return '?';
    final parts = name!.trim().split(' ');
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surfaceElevated,
        border: showBorder ? Border.all(color: borderColor, width: 2) : null,
        image: imageUrl != null ? DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.cover) : null,
      ),
      alignment: Alignment.center,
      child: imageUrl == null
          ? Text(_initials, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600))
          : null,
    );
  }
}
