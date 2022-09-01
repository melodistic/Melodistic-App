import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/models/track.model.dart';
import 'package:melodistic/screens/home/widgets/music-player.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:just_audio/just_audio.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({Key? key, this.track}) : super(key: key);
  final Track? track;
  @override
  Widget build(BuildContext context) {
    final Track track = ((ModalRoute.of(context)!.settings.arguments
        as Map<String, Track>)['track']) as Track;
    final AudioPlayer player = AudioPlayer();
    return ScreenWrapper(
        customAppbar: AppBar(
          title: const Text('Song'),
          elevation: 0,
          leading: const Padding(
            child: BackButton(),
            padding: EdgeInsets.only(left: kSizeS),
          ),
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                height: 450,
                width: double.infinity,
                child: Image.network(track.trackImageUrl, fit: BoxFit.cover)),
            kSizedBoxVerticalM,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSizeS * 1.5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      track.trackName,
                      style: kHeading2,
                    ),
                    kSizedBoxVerticalXS,
                    Text(
                      track.description,
                      style: kBody2.copyWith(color: kGrayScaleColor600),
                    ),
                    kSizedBoxVerticalM,
                    MusicPlayer(player: player, trackId: track.trackId)
                  ]),
            )
          ],
        ));
  }
}
