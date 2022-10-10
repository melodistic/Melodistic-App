import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/player.controller.dart';
import 'package:melodistic/models/track.model.dart';
import 'package:melodistic/routes.dart';

class TrackBox extends StatelessWidget {
  TrackBox({Key? key, required this.track}) : super(key: key);
  final Track track;
  final PlayerController playerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: kGrayScaleColor400),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Image.network(
                      track.trackImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const Icon(MelodisticIcon.menu_vertical,
                            color: kGrayScaleColorWhite),
                        kSizedBoxVerticalXL,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Play',
                                style: kHeading2.copyWith(
                                    color: kGrayScaleColorWhite),
                              ),
                              kSizedBoxHorizontalXXS,
                              const Icon(
                                MelodisticIcon.play,
                                color: Colors.white,
                              )
                            ]),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              track.trackName,
                              style: kHeading2,
                            ),
                            track.isFav
                                ? const Icon(MelodisticIcon.favorite_filled,
                                    color: kSecondaryColor)
                                : const Icon(MelodisticIcon.favorite)
                          ]),
                      kSizedBoxVerticalXXS,
                      Text(track.description, style: kBody2),
                      kSizedBoxVerticalXXS,
                      Text(
                        track.muscleGroup,
                        style: kBody3.copyWith(color: kGrayScaleColor500),
                      )
                    ]),
              )
            ],
          )),
      onTap: () async {
        await playerController.setupPlayer(track);
        Navigator.of(context).pushNamed(RoutesName.track);
      },
    );
  }
}
