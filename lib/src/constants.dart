import 'package:flutter/material.dart';

class Constants {
  static const String appName = 'Tdoctor';
  static const String appPackageName = 'Tdoctor';
  static const String appVersion = '1.0.0';

  // Responsive
  static const kTabletBreakpoint = 650;
  static const kDesktopBreakpoint = 1100;

  static List<Locale> languages = const [
    Locale('vi', 'VN'),
    Locale('en', 'US'),
  ];
}

class PreferenceKeys {
  static const String xToken = 'X_TOKEN';
  static const String seen = 'SEEN';
  static const String colorMode = 'COLORMODE';
  static const String language = 'LANGUAGE';
  static const String remember = 'REMEMBER';
  static const String username = 'USERNAME';
  static const String password = 'PASSWORD';
  static const String userInfo = 'USERINFO';
}

class ImageAssetPath {
  // IMAGE
  static const String icSplash = 'assets/images/ic_splash.png';
  static const String icIntro = 'assets/images/ic_intro.png';
  static const String icLogo = 'assets/images/ic_logo.png';
  static const String icFacebook = 'assets/images/ic_facebook.png';
  static const String icGoogle = 'assets/images/ic_google.png';
  static const String icEye = 'assets/images/ic_eye.png';
  static const String icPassword = 'assets/images/ic_password.png';
  static const String icUser = 'assets/images/ic_user.png';
  static const String icChecked = 'assets/images/ic_checked.png';
  static const String icCheck = 'assets/images/ic_check.png';
  static const String icCall = 'assets/images/ic_call.png';
  static const String icRequired = 'assets/images/ic_required.png';
  static const String icRequiredCheck = 'assets/images/ic_required_check.png';
  static const String icHealthcare = 'assets/images/ic_healthcare.png';
  static const String icProfessional = 'assets/images/ic_professional.png';
  static const String icBackview = 'assets/images/ic_backview.png';
  static const String icBanner1 = 'assets/images/ic_banner1.png';

  static const String icDoctorHome = 'assets/images/ic_doctor_home.png';
  static const String icDoctorVideo = 'assets/images/ic_doctor_video.png';
  static const String icDoctorChat = 'assets/images/ic_doctor_chat.png';
  static const String icDrugstore = 'assets/images/ic_drugstore.png';
  static const String icHealth = 'assets/images/ic_health.png';
  static const String icAppointment = 'assets/images/ic_appointment.png';
  static const String icInvite = 'assets/images/ic_invite.png';

  //SVG
  static const String icNavHome = 'assets/svgs/ic_home.svg';
  static const String icNavChat = 'assets/svgs/ic_chat.svg';
  static const String icNavNotification = 'assets/svgs/ic_notification.svg';
  static const String icNavProfile = 'assets/svgs/ic_profile.svg';
  static const String icBack = 'assets/svgs/ic_back.svg';
  static const String icCopy = 'assets/svgs/ic_copy.svg';
  static const String icSend = 'assets/svgs/ic_send.svg';
  static const String icGallery = 'assets/svgs/ic_gallery.svg';

  //GIF
  static const String loadingDot = 'assets/gifs/loading_dot.gif';
}
