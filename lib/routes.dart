import 'dart:js';

import 'package:flutter/material.dart';
import 'package:melodistic/screens/home/home.screen.dart';
import 'package:melodistic/screens/home/track.screen.dart';
import 'package:melodistic/screens/onboarding/login.screen.dart';
import 'package:melodistic/screens/onboarding/onboard.screen.dart';
import 'package:melodistic/screens/onboarding/register/profile.screen.dart';
import 'package:melodistic/screens/onboarding/register/register.screen.dart';
import 'package:melodistic/screens/onboarding/register/time.screen.dart';

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
