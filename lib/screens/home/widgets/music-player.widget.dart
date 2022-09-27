import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/controller/player.controller.dart';
import 'package:melodistic/screens/home/widgets/custom-track-shape.widget.dart';
import 'package:melodistic/utils/format.dart';

class MusicPlayer extends StatelessWidget {
  MusicPlayer({Key? key}) : super(key: key);
  final PlayerController playerController = Get.find();
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
          child: Obx(() => Slider(
              value: convertDurationToDoubleValue(
                  playerController.currentProgress.value),
              onChanged: (double value) {
                playerController
                    .seek(Duration(milliseconds: value.toInt() * 1000));
              },
              min: 0,
              max: convertDurationToDoubleValue(
                  playerController.currentDuration.value)))),
      kSizedBoxVerticalXS,
      Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Text>[
              Text(durationString(playerController.currentProgress.value)),
              Text(durationString(playerController.currentDuration.value))
            ],
          )),
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
            playerController.seek(Duration(
                milliseconds:
                    playerController.currentProgress.value.inMilliseconds -
                        15000));
          },
        ),
        kSizedBoxHorizontalS,
        Obx(() => playerController.isPlaying.value
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
                    onPressed: playerController.stop)))
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
                    onPressed: playerController.play)))),
        kSizedBoxHorizontalS,
        GestureDetector(
          child: const SizedBox(
            child: Icon(MelodisticIcon.forward_15_seconds,
                color: kGrayScaleColor600),
            width: kSizeS * 1.5,
            height: kSizeS * 1.5,
          ),
          onTap: () {
            playerController.seek(Duration(
                milliseconds:
                    playerController.currentProgress.value.inMilliseconds +
                        15000));
          },
        ),
      ])
    ]);
  }
}
