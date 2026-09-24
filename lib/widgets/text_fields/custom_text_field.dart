import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_text_styles.dart';

/// Standard app text field — label, hint, validation, obscure text and
/// prefix/suffix icons all in one place so forms stay consistent.
class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final bool enabled;
  final Color? fillColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final double? iconSize;
  final TextStyle? errorStyle;
  final Color? prefixIconColor;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final String? prefixImage;   
  final FocusNode? focusNode; 

  const CustomTextField({
    super.key,
    this.label,
    this.prefixImage,
    this.focusNode,  
    this.hint,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.enabled = true,
    this.fillColor,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.contentPadding,
    this.borderRadius,
    this.iconSize,
    this.errorStyle,
    this.prefixIconColor,
    this.borderColor,
    this.inputFormatters,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!, style: labelStyle ?? AppTextStyles.bodyMedium),
          const SizedBox(height: AppSizes.xs),
        ],
        TextFormField(
          controller: controller,
          focusNode: focusNode, 
          obscureText: obscureText,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          validator: validator,
          onChanged: onChanged,
          maxLines: maxLines,
          enabled: enabled,
          style: textStyle ?? AppTextStyles.bodyLarge,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                hintStyle ??
                AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
            filled: true,
            fillColor: fillColor ?? AppColors.surface,
           prefixIcon: prefixImage != null
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      prefixImage!,
                      width: iconSize ?? AppSizes.iconSm,
                      height: iconSize ?? AppSizes.iconSm,
                      fit: BoxFit.contain,
                    ),
                  )
                : (prefixIcon != null
                      ? Icon(
                          prefixIcon,
                          color: prefixIconColor ?? AppColors.grey,
                          size: iconSize ?? AppSizes.iconSm,
                        )
                      : null),
            suffixIcon: suffixIcon,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 32,
              minHeight: 24,
            ),
            counterText: '',
            contentPadding:
                contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: AppSizes.md,
                  vertical: AppSizes.md,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? AppSizes.radiusMd,
              ),
              borderSide: BorderSide(color: borderColor ?? Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? AppSizes.radiusMd,
              ),
              borderSide: BorderSide(color: borderColor ?? Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? AppSizes.radiusMd,
              ),
              borderSide: BorderSide(
                color: borderColor ?? AppColors.primary,
                width: 1.4,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? AppSizes.radiusMd,
              ),
              borderSide: const BorderSide(color: AppColors.error, width: 1.2),
            ),
            errorStyle: errorStyle,
          ),
        ),
      ],
    );
  }
}
