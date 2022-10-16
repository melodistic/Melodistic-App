import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/player.controller.dart';
import 'package:melodistic/controller/track.controller.dart';
import 'package:melodistic/screens/home/widgets/music-player.widget.dart';
import 'package:melodistic/widgets/common/appbar/back-action.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = Get.find();
    final TrackController trackController = Get.find();
    return ScreenWrapper(
        customAppbar: BackActionAppbar(
          title: 'Song',
          action: GestureDetector(
              onTap: () async {
                await trackController
                    .toggleFavorite(playerController.currentTrack.value!);
                playerController.currentTrack.value =
                    playerController.currentTrack.value!.copyWith(
                        isFav: !playerController.currentTrack.value!.isFav);
              },
              child: Obx(() => playerController.currentTrack.value!.isFav
                  ? const Icon(MelodisticIcon.favorite_filled,
                      color: kSecondaryColor)
                  : const Icon(MelodisticIcon.favorite))),
        ),
        extendBodyBehindAppBar: true,
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    height: 450,
                    width: double.infinity,
                    child: Image.network(
                        playerController.currentTrack.value!.trackImageUrl,
                        fit: BoxFit.cover)),
                kSizedBoxVerticalM,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSizeS * 1.5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          playerController.currentTrack.value!.trackName,
                          style: kHeading2,
                        ),
                        kSizedBoxVerticalXS,
                        Text(
                          playerController.currentTrack.value!.description,
                          style: kBody2.copyWith(color: kGrayScaleColor600),
                        ),
                        kSizedBoxVerticalM,
                        MusicPlayer()
                      ]),
                )
              ],
            )));
  }
}
