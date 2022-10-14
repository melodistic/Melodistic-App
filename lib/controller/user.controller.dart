import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:http_parser/http_parser.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/singleton/api_client.dart';
import 'package:melodistic/singleton/user_session.dart';

class UserController extends GetxController {
  Rxn<File> profileImage = Rxn<File>();

  void setProfileImage(File image) {
    profileImage.value = image;
  }

  Future<bool> updateProfileImage() async {
    if (profileImage.value == null) {
      return false;
    }
    final bool hasSession = await UserSession.hasSession();
    if (!hasSession) {
      Get.offAllNamed<void>(RoutesName.onboard);
      return false;
    }
    final String? userToken = await UserSession.getSession();
    final String fileExt = profileImage.value!.path.split('.').last;
    MultipartFile file = await MultipartFile.fromFile(profileImage.value!.path,
        filename: 'program_image.$fileExt',
        contentType:
            MediaType.parse('image/${fileExt == 'jpg' ? 'jpeg' : fileExt}'));
    final Response<dynamic>? response = await APIClient().postFormData(
        '/user/image',
        data: <String, MultipartFile>{'image': file},
        headers: APIClient.getAuthHeaders(userToken!));
    if (response!.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
