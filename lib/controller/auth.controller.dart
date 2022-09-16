import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:melodistic/singleton/api-client.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  ValidateFunction validateEmail = (String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Email is invalid';
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

  Future<bool> login(String email, String password) async {
    final Response<dynamic>? response =
        await APIClient().post('/auth/signin', data: <String, String>{
      'email': email,
      'password': password,
    });
    if (response == null) {
      return false;
    }
    return true;
  }
}
