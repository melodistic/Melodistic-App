import 'dart:js';

import 'package:flutter/material.dart';
import 'package:melodistic/screens/customize-track/customize.screen.dart';
import 'package:melodistic/screens/customize-track/section/break.screen.dart';
import 'package:melodistic/screens/customize-track/section/exercise.screen.dart';
import 'package:melodistic/screens/customize-track/section/section.screen.dart';
import 'package:melodistic/screens/forget-password/forget-password.screen.dart';
import 'package:melodistic/screens/forget-password/new-password.screen.dart';
import 'package:melodistic/screens/home/home.screen.dart';
import 'package:melodistic/screens/home/track.screen.dart';
import 'package:melodistic/screens/onboarding/login.screen.dart';
import 'package:melodistic/screens/onboarding/onboard.screen.dart';
import 'package:melodistic/screens/onboarding/register/profile.screen.dart';
import 'package:melodistic/screens/onboarding/register/register.screen.dart';
import 'package:melodistic/screens/onboarding/register/time.screen.dart';
import 'package:melodistic/screens/setting/help.screen.dart';
import 'package:melodistic/screens/setting/preference.screen.dart';
import 'package:melodistic/screens/setting/profile.screen.dart';
import 'package:melodistic/screens/setting/setting.screen.dart';
import 'package:melodistic/screens/user/favorite.screen.dart';
import 'package:melodistic/screens/user/library.screen.dart';
import 'package:melodistic/screens/user/upload.screen.dart';

class RoutesName {
  // Onboarding
  static const onboard = '/onboard';
  static const login = '/onboard/login';
  static const register = '/onboard/register';
  static const registerProfile = '/onboard/register/profile';
  static const registerTime = '/onboard/register/time';

  // Home
  static const home = '/home';
  static const track = '/track';

  // Customize track
  static const customize = '/customize';
  static const customizeSection = '/customize/section';
  static const customizeExerciseSection = '/customize/section/exercise';
  static const customizeBreakSection = '/customize/section/break';

  // User
  static const upload = '/upload';
  static const library = '/library';
  static const favorite = '/favorite';

  // Setting
  static const setting = '/setting';
  static const settingProfile = '/setting/profile';
  static const settingHelp = '/setting/help';
  static const settingPreference = '/setting/preference';

  // Forget Password
  static const forgetPassword = '/forget-password';
  static const newPassword = '/forget-password/new-password';
}

final onboardingRoutes = <String, WidgetBuilder>{
  RoutesName.onboard: (context) => OnboardingScreen(),
  RoutesName.login: (context) => LoginScreen(),
  RoutesName.register: (context) => RegisterScreen(),
  RoutesName.registerProfile: (context) => RegisterProfileScreen(),
  RoutesName.registerTime: (context) => RegisterTimeScreen()
};

final homeRoutes = <String, WidgetBuilder>{
  RoutesName.home: (context) => HomeScreen(),
  RoutesName.track: (context) => TrackScreen()
};

final customizeTrackRoutes = <String, WidgetBuilder>{
  RoutesName.customize: (context) => CustomizeScreen(),
  RoutesName.customizeSection: (context) => CustomizeSectionScreen(),
  RoutesName.customizeExerciseSection: (context) => CustomizeExerciseScreen(),
  RoutesName.customizeBreakSection: (context) => CustomizeBreakScreen()
};

final userRoutes = <String, WidgetBuilder>{
  RoutesName.upload: (context) => UploadScreen(),
  RoutesName.library: (context) => LibraryScreen(),
  RoutesName.favorite: (context) => FavoriteScreen()
};

final settingRoutes = <String, WidgetBuilder>{
  RoutesName.setting: (context) => SettingScreen(),
  RoutesName.settingProfile: (context) => SettingProfileScreen(),
  RoutesName.settingHelp: (context) => SettingHelpScreen(),
  RoutesName.settingPreference: (context) => SettingPreferenceScreen()
};

final newPasswordRoutes = <String, WidgetBuilder>{
  RoutesName.forgetPassword: (context) => ForgetPasswordScreen(),
  RoutesName.newPassword: (context) => NewPasswordScreen()
};

final routes = <String, WidgetBuilder>{
  ...onboardingRoutes,
  ...homeRoutes,
  ...customizeTrackRoutes,
  ...userRoutes,
  ...settingRoutes,
  ...newPasswordRoutes
};