import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:melodistic/singleton/api_client.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';

class ForgetPasswordController extends GetxController {
  final GlobalKey<FormState> requestResetPasswordFormKey =
      GlobalKey<FormState>();
  final GlobalKey<FormState> otpValidateFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();

  Rxn<String> email = Rxn<String>();
  Rxn<String> otp = Rxn<String>();
  Rx<bool> isLoading = false.obs;
  Rx<bool> isResendEmail = false.obs;

  ValidateFunction validateEmail = (String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Email is invalid';
    }
    return null;
  };

  ValidateFunction validateOTP = (String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }
    if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
      return 'OTP is invalid';
    }
    return null;
  };

  ValidateFunction validatePassword = (String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  };

  ConfirmPasswordValidateFunction validateConfirmPassword =
      (String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password is required';
    }
    if (confirmPassword != password) {
      return 'Confirm password must be the same as password';
    }
    return null;
  };

  Future<bool> requestResetPassword() async {
    if (isLoading.value) return false;
    isLoading.value = true;
    try {
      final Response<dynamic>? response = await APIClient()
          .post('/auth/forget-password', data: <String, String>{
        'email': email.value!,
      });
      if (response == null) {
        return false;
      }
      isLoading.value = false;
      return true;
    } catch (_) {
      isLoading.value = false;
      return false;
    }
  }

  Future<bool> configRequestResetPassword(String newEmail) async {
    isResendEmail.value = false;
    email.value = newEmail;
    return requestResetPassword();
  }

  Future<bool> resendRequestResetPasswordEmail() async {
    isResendEmail.value = true;
    return requestResetPassword();
  }

  Future<bool> verifyOTP(String token) async {
    if (isLoading.value) return false;
    isLoading.value = true;
    try {
      final Response<dynamic>? response = await APIClient()
          .post('/auth/reset-password/verify', data: <String, String>{
        'email': email.value!,
        'token': token,
      });
      isLoading.value = false;
      if (response == null) {
        return false;
      }
      otp.value = token;
      return true;
    } catch (_) {
      isLoading.value = false;
      return false;
    }
  }

  Future<bool> setNewPassword(String newPassword) async {
    if (isLoading.value) return false;
    isLoading.value = true;
    try {
      final Response<dynamic>? response =
          await APIClient().post('/auth/reset-password', data: <String, String>{
        'email': email.value!,
        'token': otp.value!,
        'password': newPassword,
      });
      isLoading.value = false;
      if (response == null) {
        return false;
      }
      email.value = null;
      otp.value = null;
      return true;
    } catch (_) {
      isLoading.value = false;
      return false;
    }
  }
}
