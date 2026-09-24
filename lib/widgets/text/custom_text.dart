import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final double? letterSpacing;

  const CustomText(
    this.text, {
    super.key,
    this.style,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.height,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? AppTextStyles.bodyMedium;
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: baseStyle.copyWith(
        color: color ?? baseStyle.color ?? AppColors.textPrimary,
        fontSize: fontSize ?? baseStyle.fontSize,
        fontWeight: fontWeight ?? baseStyle.fontWeight,
        height: height ?? baseStyle.height,
        letterSpacing: letterSpacing ?? baseStyle.letterSpacing,
      ),
    );
  }
}
