import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:melodistic/models/track.model.dart';
import 'dart:developer' as developer;

import 'package:melodistic/singleton/api_client.dart';

class TrackController extends GetxController {
  List<Track> publicTracks = List<Track>.empty().obs;
  List<Track> favoriteTracks = List<Track>.empty().obs;
  RxBool isFetching = false.obs;

  void updateFetching(bool? status) {
    isFetching.value = status ?? false;
  }

  Future<void> fetchPublicTracks() async {
    updateFetching(true);
    try {
      final Response<List<dynamic>>? response =
          await APIClient().get<List<dynamic>>('/track');
      if (response == null) {
        updateFetching(false);
        return;
      }
      final List<Track> tracks = response.data!
          .map((dynamic data) => Track.fromJson(data as Map<String, dynamic>))
          .toList();
      publicTracks = tracks.obs;
    } finally {
      updateFetching(false);
    }
  }

  Future<void> fetchFavoriteTracks() async {
    updateFetching(true);
    try {
      // final Response<List<dynamic>> response =
      //     await Dio().get('$apiBaseURL/track');
      // final List<Track> tracks = response.data!
      //     .map((dynamic data) => Track.fromJson(data as Map<String, dynamic>))
      //     .toList();
      // publicTracks = tracks.obs;
      final List<Track> data = <Track>[
        Track(
            trackId: '2',
            trackName: 'In the loving time',
            trackImageUrl: 'https://img.cscms.me/jd5r4pR0fJOfcmpuiG1o.png',
            muscleGroup: 'ARM',
            description: '10 minutes of arm workout',
            duration: 600,
            isPublic: true,
            isFav: true)
      ];
      favoriteTracks = data;
    } on DioError catch (e) {
      developer.log(e.toString(), name: 'TrackController');
    }
    updateFetching(false);
  }
}
