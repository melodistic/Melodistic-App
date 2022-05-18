import 'package:flutter/material.dart';
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
        child: Column(children: [
      Text(arguments["filename"]),
      MusicPlayer(player: player, filename: arguments["filename"])
    ]));
  }
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key, required this.player, required this.filename})
      : super(key: key);
  final AudioPlayer player;
  final String filename;
  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  void initState() {
    try {
      widget.player.setAudioSource(AudioSource.uri(
          Uri.parse("http://20.24.147.227:5050/api/play/" + widget.filename)));
    } catch (err) {
      print(err);
    }
    super.initState();
  }

  @override
  void dispose() {
    widget.player.stop();
    super.dispose();
  }

  var play = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      play
          ? (IconButton(
              icon: Icon(Icons.pause),
              onPressed: () {
                widget.player.pause();
                setState(() {
                  play = false;
                });
              }))
          : (IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {
                widget.player.play();
                setState(() {
                  play = true;
                });
              }))
    ]));
  }
}
