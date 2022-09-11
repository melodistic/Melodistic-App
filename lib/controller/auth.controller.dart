import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:melodistic/config/api.dart';
import 'package:melodistic/controller/alert.controller.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';

class AuthController extends GetxController {
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
    if (validateEmail(email) != null || validatePassword(password) != null) {
      return false;
    }
    try {
      await Dio().post('$apiBaseURL/auth/signin', data: {
        'email': email,
        'password': password,
      });
    } on DioError catch (error) {
      AlertController.showAlert(
          'Fail to sign in', error.response!.statusMessage!);
      return false;
    }
    return true;
  }
}
