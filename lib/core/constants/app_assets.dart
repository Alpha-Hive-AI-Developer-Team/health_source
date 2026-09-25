/// Central registry of asset paths so a renamed/moved file only breaks one line.
class AppAssets {
  AppAssets._();

  static const String _images = 'assets/images';
  static const String _icons = 'assets/icons';
  static const String _lottie = 'assets/lottie';

  static const String logo = '$_images/splash_icon.png';
    static const String login_icon = '$_images/login_image.png';
  static const String loginSuccess = '$_images/login_success_image.png';
  static const String resetPassword = '$_images/reset_password.png';
  static const String otp = '$_images/otp_image.png';
  static const String createAccount = resetPassword;
  static const String newPassword = '$_images/password.png';
  static const String onboardingBg = '$_images/onboarding_bg.png';
  static const String placeholderAvatar = '$_images/placeholder_avatar.png';
  static const String bodyScanMale = '$_images/body_scan_male.png';
  static const String bodyScanFemale = '$_images/body_scan_female.png';

  static const String icHome = '$_icons/ic_home.svg';
  static const String icRecords = '$_icons/ic_records.svg';
  static const String icScan = '$_icons/ic_scan.svg';
  static const String icProfile = '$_icons/ic_profile.svg';
  static const String icSearch = '$_icons/ic_search.svg';
  static const String icBack = '$_icons/ic_back.svg';

  static const String loadingLottie = '$_lottie/loading.json';
  static const String note_icon = '$_images/note_icon.png';
   static const String home_image = '$_images/home_card_image.png';
      static const String identificationcard = '$_images/identificationcard.png';
         static const String successmark = '$_images/successmark.png';
             static const String create_account = '$_images/create_account.png';
       static const String human1 = '$_images/human1.png';
        static const String humanside1 = '$_images/humanside1.png';
         static const String humanside2 = '$_images/humanside2.png';
}

