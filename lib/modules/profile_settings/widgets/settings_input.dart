import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/text_fields/custom_text_field.dart';
class SettingsInput extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final IconData? icon; // optional
  final String? image; // asset path, optional
  final bool obscure; // true = password field with eye toggle
  final Color iconColor; // prefix icon/image color

  const SettingsInput(
    this.controller,
    this.hint, {
    this.icon,
    this.image,
    this.obscure = false,
    this.iconColor = AppColors.primary,
    super.key,
  }) : assert(
         icon != null || image != null,
         'Provide either an icon or an image',
       );

  @override
  State<SettingsInput> createState() => _SettingsInputState();
}

class _SettingsInputState extends State<SettingsInput> {
  late bool _hidden = widget.obscure;

  @override
  Widget build(BuildContext context) => CustomTextField(
    controller: widget.controller,
    hint: widget.hint,
    obscureText: _hidden,
    prefixIcon: widget.image == null ? widget.icon : null, // only one is used
    prefixImage: widget.image,
    prefixIconColor: widget.iconColor,
    suffixIcon: widget.obscure
        ? IconButton(
            onPressed: () => setState(() => _hidden = !_hidden),
            padding: EdgeInsets.zero,
            splashRadius: 18,
            icon: Icon(
              _hidden
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColors.primary,
              size: 18,
            ),
          )
        : null,
    fillColor: AppColors.white,
    borderRadius: 7,
    iconSize: 16,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
    textStyle: AppTextStyles.bodySmall.copyWith(
      color: AppColors.primaryDark,
      fontSize: 15,
    ),
    hintStyle: AppTextStyles.bodySmall.copyWith(
      color: AppColors.grey,
      fontSize: 14,
    ),
  );
}
