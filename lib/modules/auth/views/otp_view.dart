import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/text/custom_text.dart';
import '../../../widgets/text_fields/custom_text_field.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_action_button.dart';
import '../widgets/auth_bottom_sheet.dart';

class OtpView extends GetView<AuthController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBottomSheet(
      maxHeightFactor: .86,
      // Scrollable + keyboard padding so the field is never hidden by the keyboard
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppAssets.otp,
              height: 248,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 3),
            Center(
              child: CustomText('Confirm Your Email', style: AppTextStyles.h3),
            ),
            const SizedBox(height: 9),
            Center(
              child: CustomText(
                "We've sent a verification code\nto your email address",
                style: AppTextStyles.bodySmall,
                fontSize: 12,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            CustomText(
              'Enter Verification Code',
              style: AppTextStyles.bodySmall,
              color: AppColors.white,
            ),
            const SizedBox(height: 5),
            CustomTextField(
              controller: controller.otpController,
              focusNode: controller.otpFocusNode,
              hint: 'Enter 5-digit code',
              keyboardType: TextInputType.number,
              prefixIcon: Icons.mark_email_read_outlined,
              prefixIconColor: AppColors.primary,
              fillColor: AppColors.white,
              borderRadius: 12,
              borderColor: AppColors.primary,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 5,
              iconSize: 18,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 14,
              ),
              textStyle: AppTextStyles.bodySmall.copyWith(
                color: AppColors.primaryDark,
                fontSize: 14,
              ),
              hintStyle: AppTextStyles.bodySmall.copyWith(
                color: AppColors.grey,
                fontSize: 12,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Align(
                  alignment: Alignment.centerRight,
                  widthFactor: 1,
                  child: Obx(() {
                    final canResend = controller.resendSeconds.value == 0;
                    return GestureDetector(
                      onTap: canResend ? controller.resendCode : null,
                      child: Text(
                        canResend
                            ? 'Resend'
                            : 'Resend in ${controller.resendLabel}',
                        style: AppTextStyles.bodySmall.copyWith(
                          fontSize: 12,
                          color: canResend ? AppColors.primary : AppColors.grey,
                          fontWeight: canResend
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 10),
            AuthActionButton(
              label: 'Verify and Set New Password',
              onPressed: () => Get.toNamed(AppRoutes.newPassword),
            ),
          ],
        ),
      ),
    );
  }
}
