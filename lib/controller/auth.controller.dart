import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:melodistic/models/exception.model.dart';
import 'package:melodistic/models/token.model.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/singleton/api_client.dart';
import 'package:melodistic/singleton/user_session.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';

class AuthController extends GetxController {
  final Rxn<Token> token = Rxn<Token>();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

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

  Future<bool> login(String email, String password) async {
    final Response<dynamic>? response =
        await APIClient().post('/auth/signin', data: <String, String>{
      'email': email,
      'password': password,
    });
    if (response == null) {
      return false;
    }
    token.value = Token.fromJson(response.data as Map<String, dynamic>);
    await UserSession.setSession(token.value!.token);

    return true;
  }

  Future<bool> signup(String email, String password) async {
    final Response<dynamic>? response =
        await APIClient().post('/auth/signup', data: <String, String>{
      'email': email,
      'password': password,
    });
    if (response == null) {
      return false;
    }
    token.value = Token.fromJson(response.data as Map<String, dynamic>);
    await UserSession.setSession(token.value!.token);

    return true;
  }

  Future<void> tryAutoLogin() async {
    final bool hasSession = await UserSession.hasSession();
    if (!hasSession) {
      Get.offAllNamed<void>(RoutesName.onboard);
      return;
    }
    final String? userToken = await UserSession.getSession();
    token.value = Token(token: userToken!);

    try {
      await APIClient().get<dynamic>('/auth/me',
          headers: APIClient.getAuthHeaders(token.value!.token));
    } on MelodisticException catch (_) {
      await logout();
    }
  }

  Future<void> logout() async {
    await UserSession.clearSession();
    token.value = null;
    Get.offAllNamed<void>(RoutesName.onboard);
  }
}
