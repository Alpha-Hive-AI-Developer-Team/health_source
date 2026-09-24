import 'package:get/get.dart';
import '../../modules/auth/bindings/auth_binding.dart';
import '../../modules/auth/views/login_view.dart';
import '../../modules/auth/views/login_success_view.dart';
import '../../modules/auth/views/otp_view.dart';
import '../../modules/auth/views/reset_password_view.dart';
import '../../modules/auth/views/new_password_view.dart';
import '../../modules/auth/views/create_account_view.dart';
import '../../modules/auth/views/create_account_details_view.dart';
import '../../modules/splash/bindings/splash_binding.dart';
import '../../modules/splash/views/splash_view.dart';
import '../../modules/home/bindings/home_binding.dart';
import '../../modules/home/views/home_view.dart';
import 'app_routes.dart';
import '../../modules/search/bindings/search_binding.dart';
import '../../modules/search/views/search_view.dart';
import '../../modules/patient_records/bindings/patient_records_binding.dart';
import '../../modules/patient_records/views/patient_records_view.dart';
import '../../modules/patient_records/views/patient_detail_view.dart';
import '../../modules/profile_settings/bindings/profile_settings_binding.dart';
import '../../modules/profile_settings/views/change_password_view.dart';
import '../../modules/profile_settings/views/edit_profile_view.dart';
import '../../modules/profile_settings/views/help_support_view.dart';
import '../../modules/profile_settings/views/profile_view.dart';
import '../../modules/profile_settings/views/settings_view.dart';
import '../../modules/new_scan/bindings/new_scan_binding.dart';
import '../../modules/new_scan/views/new_scan_view.dart';
import '../../modules/new_scan/views/ready_for_scan_view.dart';
import '../../modules/new_scan/views/scan_progress_view.dart';
import '../../modules/new_scan/views/scan_result_view.dart';
import '../../modules/new_scan/views/scan_type_view.dart';

class AppPages {
  AppPages._();

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.loginSuccess,
      page: () => const LoginSuccessView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyEmail,
      page: () => const OtpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.newPassword,
      page: () => const NewPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.createAccount,
      page: () => const CreateAccountView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.createAccountDetails,
      page: () => const CreateAccountDetailsView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRoutes.patientRecords,
      page: () => const PatientRecordsView(),
      binding: PatientRecordsBinding(),
    ),
    GetPage(
      name: AppRoutes.patientDetail,
      page: () => const PatientDetailView(),
      binding: PatientRecordsBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileSettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
      binding: ProfileSettingsBinding(),
    ),
    GetPage(
      name: '/profile/edit',
      page: () => const EditProfileView(),
      binding: ProfileSettingsBinding(),
    ),
    GetPage(
      name: '/profile/password',
      page: () => const ChangePasswordView(),
      binding: ProfileSettingsBinding(),
    ),
    GetPage(
      name: '/profile/help',
      page: () => const HelpSupportView(),
      binding: ProfileSettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.newScan,
      page: () => const NewScanView(),
      binding: NewScanBinding(),
    ),
    GetPage(
      name: AppRoutes.scanType,
      page: () => const ScanTypeView(),
      binding: NewScanBinding(),
    ),
    GetPage(
      name: AppRoutes.scanReady,
      page: () => const ReadyForScanView(),
      binding: NewScanBinding(),
    ),
    GetPage(
      name: '/new-scan/progress',
      page: () => const ScanProgressView(),
      binding: NewScanBinding(),
    ),
    GetPage(
      name: AppRoutes.scanResult,
      page: () => const ScanResultView(),
      binding: NewScanBinding(),
    ),
  ];
}
