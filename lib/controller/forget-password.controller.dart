import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:melodistic/singleton/api_client.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';

class ForgetPasswordController extends GetxController {
  final GlobalKey<FormState> requestResetPasswordFormKey =
      GlobalKey<FormState>();
  Rxn<String> email = Rxn<String>();

  ValidateFunction validateEmail = (String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Email is invalid';
    }
    return null;
  };

  Future<bool> requestResetPassword() async {
    final Response<dynamic>? response =
        await APIClient().post('/auth/forget-password', data: <String, String>{
      'email': email.value!,
    });
    if (response == null) {
      return false;
    }
    return true;
  }

  Future<bool> configRequestResetPassword(String newEmail) async {
    email.value = newEmail;
    return requestResetPassword();
  }
}
