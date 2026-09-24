import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/text/custom_text.dart';
import '../../../widgets/text_fields/custom_text_field.dart';
import '../controllers/auth_controller.dart';
import '../widgets/login_divider.dart';
import '../widgets/auth_action_button.dart';
import '../widgets/auth_bottom_sheet.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBottomSheet(
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 19),
            Center(
              child: Image.asset(
                AppAssets.login_icon,
                width: 228,
                height: 85,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 23),
            Center(
              child: CustomText(
                'Welcome Back!',
                style: AppTextStyles.h3,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 9),
            Center(
              child: CustomText(
                'Enter your info to continue',
                style: AppTextStyles.bodySmall,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 24),
            CustomText(
              'Email',
              style: AppTextStyles.bodySmall,
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 5),
            CustomTextField(
              controller: controller.emailController,
              hint: 'Hello@style.com',
            
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.alternate_email_rounded,
              fillColor: AppColors.white,
              borderRadius: 7,
              iconSize: 13,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 11,
              ),
              textStyle: AppTextStyles.bodySmall.copyWith(
                color: AppColors.primaryDark,
                fontSize: 15,
              ),
              hintStyle: AppTextStyles.bodySmall.copyWith(
                color: AppColors.grey,
                fontSize: 14,
              ),
              errorStyle: const TextStyle(fontSize: 14, height: 1),
              validator: (value) => value == null || !value.contains('@')
                  ? 'Enter a valid email'
                  : null,
            ),
            const SizedBox(height: 13),
            CustomText(
              'Password',
              style: AppTextStyles.bodySmall,
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 5),
            Obx(
              () => CustomTextField(
                controller: controller.passwordController,
                hint: '••••••••••',
                obscureText: controller.obscurePassword.value,
                prefixIcon: Icons.lock_outline_rounded,
                suffixIcon: IconButton(
                  onPressed: controller.togglePasswordVisibility,
                  icon: Icon(
                    controller.obscurePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.primary,
                    size: 16,
                  ),
                ),
                fillColor: AppColors.white,
                borderRadius: 7,
                iconSize: 13,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 11,
                ),
                textStyle: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.primaryDark,
                  fontSize: 15,
                ),
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
                errorStyle: const TextStyle(fontSize: 14, height: 1),
                validator: (value) => value == null || value.length < 6
                    ? 'Password must be 6 characters'
                    : null,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Obx(
                  () => SizedBox(
                    width: 14,
                    height: 14,
                    child: Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (_) => controller.toggleRememberMe(),
                      activeColor: AppColors.primary,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                CustomText(
                  'Remember me',
                  style: AppTextStyles.bodySmall,
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: controller.openResetPassword,
                  child: CustomText(
                    'Forgot password',
                    style: AppTextStyles.bodySmall,
                    color: AppColors.primary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 17),
            AuthActionButton(label: 'Sign in', onPressed: controller.signIn),
            const SizedBox(height: 11),
            const LoginDivider(),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const CustomText(
                  'G',
                  color: Color(0xFF4285F4),
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
                label: CustomText(
                  'Continue with Google',
                  style: AppTextStyles.buttonMedium,
                  fontSize: 16,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF211817),
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: GestureDetector(
                onTap: controller.openCreateAccount,
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 12,
                      color: AppColors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up here',
                        style: AppTextStyles.bodySmall.copyWith(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
