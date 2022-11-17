import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:melodistic/config/api.dart';
import 'package:melodistic/models/track.model.dart';

class PlayerController extends GetxController {
  AudioPlayer? player;
  Rxn<Track> currentTrack = Rxn<Track>();
  Rx<Duration> currentDuration = Duration.zero.obs;
  Rx<Duration> currentProgress = Duration.zero.obs;
  Rx<bool> isPlaying = false.obs;

  Future<void> setupPlayer(Track track) async {
    currentTrack.value = track;
    player = AudioPlayer();
    if (player != null) {
      await player!
          .setAudioSource(
              AudioSource.uri(Uri.parse('$apiBaseURL/stream/${track.trackId}')))
          .then((Duration? duration) {
        if (duration != null) currentDuration.value = duration;
      });
      player!.positionStream.listen((Duration position) {
        currentProgress.value = position;
      });
    }
  }

  Future<void> play() async {
    isPlaying.value = true;
    if (player != null) {
      await player!.play();
    }
  }

  Future<void> pause() async {
    isPlaying.value = false;
    if (player != null) {
      await player!.pause();
    }
  }

  Future<void> seek(Duration duration) async {
    if (player != null) {
      await player!.seek(duration);
    }
    await play();
  }

  Future<void> stop() async {
    isPlaying.value = false;
    if (player != null) {
      await player!.stop();
    }
  }

  Future<void> clearPlayer() async {
    stop();
    currentTrack.value = null;
    currentDuration.value = Duration.zero;
    currentProgress.value = Duration.zero;
    isPlaying.value = false;
    if (player != null) {
      await player!.dispose();
    }
  }
}
