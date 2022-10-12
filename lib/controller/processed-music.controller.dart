import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:melodistic/models/exception.model.dart';
import 'package:melodistic/models/processed-music.model.dart';
import 'package:melodistic/singleton/api_client.dart';
import 'package:melodistic/singleton/user_session.dart';

class ProcessedMusicController extends GetxController {
  RxList<ProcessedMusic> processedMusic = List<ProcessedMusic>.empty().obs;
  RxBool isFetching = false.obs;

  void updateFetching(bool? status) {
    isFetching.value = status ?? false;
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
