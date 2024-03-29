import 'package:flutter/material.dart';
import 'package:melodistic/screens/customize-track/customize.screen.dart';
import 'package:melodistic/screens/customize-track/section/section-detail.screen.dart';
import 'package:melodistic/screens/customize-track/section/section.screen.dart';
import 'package:melodistic/screens/forget-password/forget-password.screen.dart';
import 'package:melodistic/screens/forget-password/new-password.screen.dart';
import 'package:melodistic/screens/forget-password/validate-otp.screen.dart';
import 'package:melodistic/screens/home/home.screen.dart';
import 'package:melodistic/screens/home/track.screen.dart';
import 'package:melodistic/screens/onboarding/login.screen.dart';
import 'package:melodistic/screens/onboarding/onboard.screen.dart';
import 'package:melodistic/screens/onboarding/register/register.screen.dart';
import 'package:melodistic/screens/onboarding/register/time.screen.dart';
import 'package:melodistic/screens/setting/password.screen.dart';
import 'package:melodistic/screens/setting/profile.screen.dart';
import 'package:melodistic/screens/setting/setting.screen.dart';
import 'package:melodistic/screens/user/favorite.screen.dart';
import 'package:melodistic/screens/user/library.screen.dart';
import 'package:melodistic/screens/user/upload.screen.dart';

class RoutesName {
  // Onboarding
  static const String onboard = '/onboard';
  static const String login = '/onboard/login';
  static const String register = '/onboard/register';
  static const String registerTime = '/onboard/register/time';

  // Home
  static const String home = '/home';
  static const String track = '/track';

  // Customize track
  static const String customize = '/customize';
  static const String customizeSection = '/customize/section';
  static const String customizeSectionDetail = '/customize/section/detail';

  // User
  static const String upload = '/upload';
  static const String library = '/library';
  static const String favorite = '/favorite';

  // Setting
  static const String setting = '/setting';
  static const String settingProfile = '/setting/profile';
  static const String settingPassword = '/setting/password';

  // Forget Password
  static const String forgetPassword = '/forget-password';
  static const String validateOtp = '/validate-otp';
  static const String newPassword = '/forget-password/new-password';
}

final Map<String, WidgetBuilder> onboardingRoutes = <String, WidgetBuilder>{
  RoutesName.onboard: (BuildContext context) => const OnboardingScreen(),
  RoutesName.login: (BuildContext context) => LoginScreen(),
  RoutesName.register: (BuildContext context) => RegisterScreen(),
  RoutesName.registerTime: (BuildContext context) => RegisterTimeScreen()
};

final Map<String, WidgetBuilder> homeRoutes = <String, WidgetBuilder>{
  RoutesName.home: (BuildContext context) => HomeScreen(),
  RoutesName.track: (BuildContext context) => const TrackScreen()
};

final Map<String, WidgetBuilder> customizeTrackRoutes = <String, WidgetBuilder>{
  RoutesName.customize: (BuildContext context) => CustomizeScreen(),
  RoutesName.customizeSection: (BuildContext context) =>
      CustomizeSectionScreen(),
  RoutesName.customizeSectionDetail: (BuildContext context) =>
      CustomizeSectionDetailScreen(),
};

final Map<String, WidgetBuilder> userRoutes = <String, WidgetBuilder>{
  RoutesName.upload: (BuildContext context) => UploadScreen(),
  RoutesName.library: (BuildContext context) => LibraryScreen(),
  RoutesName.favorite: (BuildContext context) => FavoriteScreen()
};

final Map<String, WidgetBuilder> settingRoutes = <String, WidgetBuilder>{
  RoutesName.setting: (BuildContext context) => SettingScreen(),
  RoutesName.settingProfile: (BuildContext context) => SettingProfileScreen(),
  RoutesName.settingPassword: (BuildContext context) => SettingPasswordScreen(),
};

final Map<String, WidgetBuilder> newPasswordRoutes = <String, WidgetBuilder>{
  RoutesName.forgetPassword: (BuildContext context) => ForgetPasswordScreen(),
  RoutesName.validateOtp: (BuildContext context) => ValidateOtpScreen(),
  RoutesName.newPassword: (BuildContext context) => NewPasswordScreen()
};

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  ...onboardingRoutes,
  ...homeRoutes,
  ...customizeTrackRoutes,
  ...userRoutes,
  ...settingRoutes,
  ...newPasswordRoutes
};
