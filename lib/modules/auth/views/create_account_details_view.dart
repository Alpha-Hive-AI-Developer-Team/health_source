import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/text/custom_text.dart';
import '../../../widgets/text_fields/custom_text_field.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_action_button.dart';
import '../widgets/auth_bottom_sheet.dart';
class CreateAccountDetailsView extends GetView<AuthController> {
  const CreateAccountDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBottomSheet(
      maxHeightFactor: .96,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              AppAssets.login_icon,
            
              height: 83,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 18),
          Center(
            child: CustomText(
              'Create Your Account',
              style: AppTextStyles.h3,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: CustomText(
              'Create account for exploring news',
              style: AppTextStyles.bodySmall,
              fontSize: 14,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 22),
          _AuthField(
            label: 'First Name',
            hint: 'First Name',
            controller: controller.firstNameController,
            image: AppAssets.identificationcard, // image, not icon
          ),
          const SizedBox(height: 10),
          _AuthField(
            label: 'Last Name',
            hint: 'Last Name',
            controller: controller.lastNameController,
            image: AppAssets.identificationcard,
          ),
          const SizedBox(height: 10),
          _AuthField(
            label: 'Password',
            hint: 'Enter your password',
            controller: controller.passwordController,
            icon: Icons.lock_outline_rounded,
            isPassword: true,
          ),
          const SizedBox(height: 10),
          _AuthField(
            label: 'Confirm Password',
            hint: 'Confirm your password',
            controller: controller.confirmPasswordController,
            icon: Icons.lock_outline_rounded,
            isPassword: true,
          ),
          const SizedBox(height: 12),
          AuthActionButton(
            label: 'Create Account',
            onPressed: controller.createAccount,
          ),
        ],
      ),
    );
  }
}

class _AuthField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData? icon;
  final String? image; // if set, it is used instead of the icon
  final bool isPassword;

  const _AuthField({
    required this.label,
    required this.hint,
    required this.controller,
    this.icon,
    this.image,
    this.isPassword = false,
  });

  @override
  State<_AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<_AuthField> {
  late bool _hidden = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          widget.label,
          style: AppTextStyles.bodySmall,
          color: AppColors.white,
          fontSize: 14,
        ),
        const SizedBox(height: 5),
        CustomTextField(
          controller: widget.controller,
          hint: widget.hint,
          obscureText: _hidden,
          prefixIcon: widget.image == null ? widget.icon : null,
          prefixImage: widget.image,
          prefixIconColor: AppColors.primary,
          suffixIcon: widget.isPassword
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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 11,
          ),
          textStyle: AppTextStyles.bodySmall.copyWith(
            color: AppColors.primaryDark,
            fontSize: 14,
          ),
          hintStyle: AppTextStyles.bodySmall.copyWith(
            color: AppColors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
