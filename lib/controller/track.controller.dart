import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:melodistic/models/exception.model.dart';
import 'package:melodistic/models/track.model.dart';

import 'package:melodistic/singleton/api_client.dart';
import 'package:melodistic/singleton/user_session.dart';

class TrackController extends GetxController {
  RxList<Track> publicTracks = List<Track>.empty().obs;
  RxList<Track> libraryTracks = List<Track>.empty().obs;
  RxList<Track> favoriteTracks = List<Track>.empty().obs;
  RxBool isFetching = false.obs;

  void updateFetching(bool? status) {
    isFetching.value = status ?? false;
  }

  Future<bool> deleteTrack(String? trackId) async {
    try {
      final bool hasSession = await UserSession.hasSession();
      if (!hasSession) throw MelodisticException('Unauthorized');
      final String? userToken = await UserSession.getSession();
      await APIClient().delete<Map<String, dynamic>>('/track/$trackId',
          headers: APIClient.getAuthHeaders(userToken!));
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> fetchPublicTracks() async {
    await Future<void>.delayed(Duration.zero);
    updateFetching(true);
    try {
      final bool hasSession = await UserSession.hasSession();
      if (!hasSession) throw MelodisticException('Unauthorized');
      final String? userToken = await UserSession.getSession();
      final Response<List<dynamic>>? response = await APIClient()
          .get<List<dynamic>>('/track',
              headers: APIClient.getAuthHeaders(userToken!));
      if (response == null) {
        updateFetching(false);
        return;
      }
      final List<Track> tracks = response.data!
          .map((dynamic data) => Track.fromJson(data as Map<String, dynamic>))
          .toList();
      publicTracks.value = tracks;
    } catch (_) {
    } finally {
      updateFetching(false);
    }
  }

  Future<void> fetchLibraryTrack() async {
    await Future<void>.delayed(Duration.zero);
    updateFetching(true);
    try {
      final bool hasSession = await UserSession.hasSession();
      if (!hasSession) throw MelodisticException('Unauthorized');
      final String? userToken = await UserSession.getSession();
      final Response<List<dynamic>>? response = await APIClient()
          .get<List<dynamic>>('/user/library',
              headers: APIClient.getAuthHeaders(userToken!));
      if (response == null) {
        updateFetching(false);
        return;
      }
      final List<Track> tracks = response.data!
          .map((dynamic data) => Track.fromJson(data as Map<String, dynamic>))
          .toList();
      libraryTracks.value = tracks;
    } catch (_) {
    } finally {
      updateFetching(false);
    }
  }

  Future<void> fetchFavoriteTracks() async {
    await Future<void>.delayed(Duration.zero);
    updateFetching(true);
    try {
      final bool hasSession = await UserSession.hasSession();
      if (!hasSession) throw MelodisticException('Unauthorized');
      final String? userToken = await UserSession.getSession();
      final Response<List<dynamic>>? response = await APIClient()
          .get<List<dynamic>>('/user/favorite',
              headers: APIClient.getAuthHeaders(userToken!));
      if (response == null) {
        updateFetching(false);
        return;
      }
      final List<Track> tracks = response.data!
          .map((dynamic data) => Track.fromJson(data as Map<String, dynamic>))
          .toList();
      favoriteTracks.value = tracks;
    } catch (_) {
    } finally {
      updateFetching(false);
    }
  }

  Future<Track> getTrackInformation(String trackId) async {
    await Future<void>.delayed(Duration.zero);
    try {
      final bool hasSession = await UserSession.hasSession();
      if (!hasSession) throw MelodisticException('Unauthorized');
      final String? userToken = await UserSession.getSession();
      final Response<Map<String, dynamic>>? trackResponse = await APIClient()
          .get('/track/$trackId',
              headers: APIClient.getAuthHeaders(userToken!));
      final Track track = Track.fromJson(trackResponse!.data!);
      return track;
    } catch (_) {
      rethrow;
    }
  }

  Future<bool> toggleFavorite(String? trackId) async {
    try {
      final bool hasSession = await UserSession.hasSession();
      if (!hasSession) throw MelodisticException('Unauthorized');
      final String? userToken = await UserSession.getSession();
      await APIClient().post<dynamic>('/user/favorite',
          data: {'track_id': trackId},
          headers: APIClient.getAuthHeaders(userToken!));
      return true;
    } catch (_) {
      return false;
    }
  }
}
