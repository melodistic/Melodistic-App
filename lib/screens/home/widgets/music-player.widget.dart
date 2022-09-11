import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/api.dart';
import 'package:melodistic/screens/home/widgets/custom-track-shape.widget.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key, required this.player, required this.trackId})
      : super(key: key);
  final AudioPlayer player;
  final String trackId;
  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  @override
  void initState() {
    try {
      widget.player
          .setAudioSource(AudioSource.uri(
              Uri.parse('$apiBaseURL/stream/' + widget.trackId)))
          .then((Duration? value) {
        setState(() {
          _duration = value!;
        });
      });
      widget.player.createPositionStream().listen((Duration position) {
        setState(() {
          _position = position;
        });
      });
    } catch (err) {
      return;
    }
    super.initState();
  }

  @override
  void dispose() {
    widget.player.stop();
    widget.player.dispose();
    super.dispose();
  }

  double convertDurationToDoubleValue(Duration? duration) {
    if (duration == null) return 0;
    return duration.inMilliseconds / 1000;
  }

  String durationString(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  void playMusic() {
    widget.player.play();
    setState(() {
      play = true;
    });
  }

  void stopMusic() {
    widget.player.pause();
    setState(() {
      play = false;
    });
  }

  bool play = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SliderTheme(
          data: SliderThemeData(
              thumbColor: kPrimaryColor,
              activeTrackColor: kPrimaryColor,
              inactiveTrackColor: kGrayScaleColor200,
              trackHeight: kSizeXXS * 1.5,
              overlayColor: kPrimaryColor,
              overlayShape: SliderComponentShape.noOverlay,
              trackShape: CustomTrackShape(),
              thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: kSizeXXS * 1.5)),
          child: Slider(
              value: convertDurationToDoubleValue(_position),
              onChanged: (double value) {
                widget.player
                    .seek(Duration(milliseconds: value.toInt() * 1000));
                playMusic();
              },
              min: 0,
              max: convertDurationToDoubleValue(widget.player.duration))),
      kSizedBoxVerticalXS,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Text>[
          Text(durationString(_position)),
          Text(durationString(_duration))
        ],
      ),
      kSizedBoxVerticalM,
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        GestureDetector(
          child: const SizedBox(
            child: Icon(MelodisticIcon.backward_15_seconds,
                color: kGrayScaleColor600),
            width: kSizeS * 1.5,
            height: kSizeS * 1.5,
          ),
          onTap: () {
            widget.player
                .seek(Duration(milliseconds: _position.inMilliseconds - 15000));
            playMusic();
          },
        ),
        kSizedBoxHorizontalS,
        play
            ? (Container(
                width: kSizeL,
                height: kSizeL,
                decoration: const BoxDecoration(
                    borderRadius: kBorderRadiusM, color: kGrayScaleColorWhite),
                child: IconButton(
                    icon: const Icon(
                      Icons.pause,
                    ),
                    iconSize: kSizeM,
                    onPressed: stopMusic)))
            : (Container(
                width: kSizeL,
                height: kSizeL,
                decoration: const BoxDecoration(
                    borderRadius: kBorderRadiusM, color: kPrimaryColor),
                child: IconButton(
                    icon: const Icon(
                      Icons.play_arrow_outlined,
                      color: kGrayScaleColorWhite,
                    ),
                    iconSize: kSizeM,
                    onPressed: playMusic))),
        kSizedBoxHorizontalS,
        GestureDetector(
          child: const SizedBox(
            child: Icon(MelodisticIcon.forward_15_seconds,
                color: kGrayScaleColor600),
            width: kSizeS * 1.5,
            height: kSizeS * 1.5,
          ),
          onTap: () {
            widget.player
                .seek(Duration(milliseconds: _position.inMilliseconds + 15000));
            playMusic();
          },
        ),
      ])
    ]);
  }
}
