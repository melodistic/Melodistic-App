import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:just_audio/just_audio.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final player = AudioPlayer();
    return ScreenWrapper(
        customAppbar: AppBar(
          title: Text("Song"),
          elevation: 0,
          leading: Padding(
            child: BackButton(),
            padding: EdgeInsets.only(left: kSizeS),
          ),
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 450,
                width: double.infinity,
                child: Image.network(arguments["track"]["track_image_url"],
                    fit: BoxFit.cover)),
            kSizedBoxVerticalM,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kSizeS * 1.5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      arguments["track"]["track_name"],
                      style: TextStyle(
                          fontWeight: kFontWeightBold, fontSize: kFontSizeS),
                    ),
                    kSizedBoxVerticalXS,
                    Text(
                      arguments["track"]["description"],
                      style: TextStyle(
                          fontWeight: kFontWeightRegular,
                          color: Color(0xFF94A2AB),
                          fontSize: kFontSizeXS),
                    ),
                    kSizedBoxVerticalM,
                    MusicPlayer(
                        player: player,
                        trackId: arguments["track"]["track_id"])
                  ]),
            )
          ],
        ));
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

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
          .setAudioSource(AudioSource.uri(Uri.parse(
              "https://melodistic-aks.ggolfz.me/api/stream/" + widget.trackId)))
          .then((value) {
        setState(() {
          _duration = value!;
        });
      });
      widget.player.createPositionStream().listen((position) {
        setState(() {
          _position = position;
        });
      });
    } catch (err) {
      print(err);
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
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
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

  var play = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      SliderTheme(
          data: SliderThemeData(
              thumbColor: Colors.black,
              activeTrackColor: Colors.black,
              inactiveTrackColor: Color(0xFFEDF2F6),
              trackHeight: 6,
              overlayColor: Colors.black,
              overlayShape: SliderComponentShape.noOverlay,
              trackShape: CustomTrackShape(),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6)),
          child: Slider(
              value: convertDurationToDoubleValue(_position),
              onChanged: (value) {
                widget.player
                    .seek(Duration(milliseconds: value.toInt() * 1000));
                playMusic();
              },
              min: 0,
              max: convertDurationToDoubleValue(widget.player.duration))),
      kSizedBoxVerticalXS,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(durationString(_position)),
          Text(durationString(_duration))
        ],
      ),
      kSizedBoxVerticalM,
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          child: SizedBox(
            child: Image.asset(
              "assets/iconoir_backward-15-seconds.png",
              fit: BoxFit.contain,
            ),
            width: 20,
            height: 20,
          ),
          onTap: () {
            widget.player
                .seek(Duration(milliseconds: _position.inMilliseconds - 15000));
            playMusic();
          },
        ),
        kSizedBoxHorizontalS,
        play
            ? (IconButton(
                icon: Icon(
                  Icons.pause,
                ),
                splashRadius: kSizeM + kSizeXS,
                iconSize: kSizeL,
                onPressed: stopMusic))
            : (IconButton(
                icon: Icon(
                  Icons.play_circle,
                ),
                splashRadius: kSizeM + kSizeXS,
                iconSize: kSizeL,
                onPressed: playMusic)),
        kSizedBoxHorizontalS,
        GestureDetector(
          child: SizedBox(
            child: Image.asset(
              "assets/iconoir_forward-15-seconds.png",
              fit: BoxFit.contain,
            ),
            width: 20,
            height: 20,
          ),
          onTap: () {
            widget.player
                .seek(Duration(milliseconds: _position.inMilliseconds + 15000));
            playMusic();
          },
        ),
      ])
    ]));
  }
}
