import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:http_parser/http_parser.dart';
import 'package:melodistic/models/exception.model.dart';
import 'package:melodistic/models/processed-music.model.dart';
import 'package:melodistic/singleton/api_client.dart';
import 'package:melodistic/singleton/user_session.dart';

class ProcessedMusicController extends GetxController {
  RxList<ProcessedMusic> processedMusic = RxList<ProcessedMusic>();
  RxBool isFetching = false.obs;
  Rxn<File> processedSongFile = Rxn<File>();

  Future<void> setProcessedSongFile(File newProcessedSongFile) async {
    processedSongFile.value = newProcessedSongFile;
  }

  void updateFetching(bool? status) {
    isFetching.value = status ?? false;
  }

  Future<bool> deleteProcessedMusic(String? processId) async {
    try {
      final bool hasSession = await UserSession.hasSession();
      if (!hasSession) throw MelodisticException('Unauthorized');
      final String? userToken = await UserSession.getSession();
      await APIClient().delete<Map<String, dynamic>>('/process/$processId',
          headers: APIClient.getAuthHeaders(userToken!));
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> processedYoutubeLink(String url) async {
    final bool hasSession = await UserSession.hasSession();
    if (!hasSession) {
      throw MelodisticException('Unauthorized');
    }
    final String? userToken = await UserSession.getSession();
    final Response<dynamic>? response = await APIClient().post(
        '/process/youtube',
        data: <String, String>{'url': url},
        headers: APIClient.getAuthHeaders(userToken!));
    if (response == null) {
      return false;
    }
    return true;
  }

  Future<bool> processedFile() async {
    final bool hasSession = await UserSession.hasSession();
    if (!hasSession) {
      throw MelodisticException('Unauthorized');
    }
    final String? userToken = await UserSession.getSession();
    MultipartFile file = await MultipartFile.fromFile(
        processedSongFile.value!.path,
        filename: processedSongFile.value!.path.split('/').last,
        contentType: MediaType.parse('audio/wav'));
    final Response<dynamic>? response = await APIClient().postFormData(
        '/process/file',
        data: <String, MultipartFile>{'music': file},
        headers: APIClient.getAuthHeaders(userToken!));
    if (response!.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> fetchProcessedMusic() async {
    await Future<void>.delayed(Duration.zero);
    updateFetching(true);
    try {
      final bool hasSession = await UserSession.hasSession();
      if (!hasSession) throw MelodisticException('Unauthorized');
      final String? userToken = await UserSession.getSession();
      final Response<List<dynamic>>? response = await APIClient()
          .get<List<dynamic>>('/process',
              headers: APIClient.getAuthHeaders(userToken!));
      if (response == null) {
        updateFetching(false);
        return;
      }
      final List<ProcessedMusic> musics = response.data!
          .map((dynamic data) =>
              ProcessedMusic.fromJson(data as Map<String, dynamic>))
          .toList();
      processedMusic.value = musics;
    } catch (_) {
    } finally {
      updateFetching(false);
    }
  }
}
