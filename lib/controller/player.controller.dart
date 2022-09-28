import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:melodistic/config/api.dart';
import 'package:melodistic/models/track.model.dart';

class PlayerController extends GetxController {
  AudioPlayer player = AudioPlayer();
  Rxn<Track> currentTrack = Rxn<Track>();
  Rx<Duration> currentDuration = Duration.zero.obs;
  Rx<Duration> currentProgress = Duration.zero.obs;
  Rx<bool> isPlaying = false.obs;

  Future<void> setupPlayer(Track track) async {
    currentTrack.value = track;
    await player
        .setAudioSource(
            AudioSource.uri(Uri.parse('$apiBaseURL/stream/${track.trackId}')))
        .then((Duration? duration) {
      if (duration != null) currentDuration.value = duration;
    });
    player.positionStream.listen((Duration position) {
      currentProgress.value = position;
    });
  }

  Future<void> play() async {
    await player.play();
    isPlaying.value = true;
  }

  Future<void> pause() async {
    await player.pause();
    isPlaying.value = false;
  }

  Future<void> seek(Duration duration) async {
    await player.seek(duration);
    await play();
  }

  Future<void> stop() async {
    await player.stop();
    isPlaying.value = false;
  }
}
