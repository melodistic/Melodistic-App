import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:melodistic/config/api.dart';
import 'package:melodistic/models/track.model.dart';
import 'dart:developer' as developer;

class TrackController extends GetxController {
  List<Track> publicTracks = List<Track>.empty().obs;
  RxBool isFetching = false.obs;

  void updateFetching(bool? status) {
    isFetching.value = status ?? false;
  }

  Future<void> fetchPublicTracks() async {
    updateFetching(true);
    try {
      // final Response<List<dynamic>> response =
      //     await Dio().get('$apiBaseURL/api/track');
      // final List<Track> tracks = response.data!
      //     .map((dynamic data) => Track.fromJson(data as Map<String, dynamic>))
      //     .toList();
      // publicTracks = tracks.obs;
      final List<Track> data = <Track>[
        Track(
            trackId: '1',
            trackName: "It's long time ago",
            trackImageUrl: 'https://img.cscms.me/6b4X3LyVJOYaLd9UXVOq.png',
            muscleGroup: 'ABS',
            description: '12 minutes of abs workout',
            duration: 720,
            isPublic: true),
        Track(
            trackId: '2',
            trackName: 'In the loving time',
            trackImageUrl: 'https://img.cscms.me/jd5r4pR0fJOfcmpuiG1o.png',
            muscleGroup: 'ARM',
            description: '10 minutes of arm workout',
            duration: 600,
            isPublic: true),
        Track(
            trackId: '3',
            trackName: "Let's have a party",
            trackImageUrl: 'https://img.cscms.me/cwiYBrsYDr3kHufJYn7T.png',
            muscleGroup: 'CORE',
            description: '8 minutes of core workout',
            duration: 8,
            isPublic: true),
      ];
      publicTracks = data;
    } on DioError catch (e) {
      developer.log(e.toString(), name: 'TrackController');
    }
    updateFetching(false);
  }
}
