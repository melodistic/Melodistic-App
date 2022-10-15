import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/processed-music.controller.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/screens/user/widget/imported-song.widget.dart';
import 'package:melodistic/utils/format.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/divider.widget.dart';

class UploadSongPopup extends StatelessWidget {
  UploadSongPopup({Key? key}) : super(key: key);

  final bool check = false;
  final ProcessedMusicController musicController = Get.find();
  final TrackCustomizeController trackCustomizeController = Get.find();
  final List<Map<String, String>> uploadedSong = <Map<String, String>>[
    <String, String>{
      'name': 'how you like that',
      'artist': 'black pink',
      'time': '2.03'
    },
    <String, String>{
      'name': 'not a home',
      'artist': 'pardyalone',
      'time': '3.23'
    },
  ];

  final List<Map<String, String>> selectedSong = <Map<String, String>>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Import your music', style: kHeading3),
        kSizedBoxVerticalXS,
        Text(
          'Please follow these instructions to upload your music. going to the',
          style: kBody3.copyWith(color: kGrayScaleColor600),
        ),
        Text('home page > menu > upload',
            style: kBody3.copyWith(color: kGrayScaleColor700)),
        kSizedBoxVerticalXS,
        const MelodisticDivider(),
        const Text('Musics uploaded', style: kBody3Medium),
        kSizedBoxVerticalS,
        SizedBox(
          width: 260,
          height: 180,
          child: Obx(() => ListView.separated(
              itemCount: musicController.processedMusic.length,
              itemBuilder: (BuildContext context, int index) {
                return Expanded(
                    child: ImportedSongWidget(
                        name: musicController.processedMusic[index].musicName,
                        time: durationString(Duration(
                            seconds: musicController
                                .processedMusic[index].duration)),
                        value: musicController.processedMusic[index].processId,
                        groupValue: trackCustomizeController.selectedSong,
                        onChanged: (bool? check) {
                          if (check!) {
                            trackCustomizeController.selectedSong.add(
                                musicController
                                    .processedMusic[index].processId);
                          } else {
                            trackCustomizeController.selectedSong.remove(
                                musicController
                                    .processedMusic[index].processId);
                          }
                        }));
              },
              separatorBuilder: ((BuildContext context, int index) =>
                  const MelodisticDivider()))),
        ),
        const ButtonWidget(
          text: 'Add',
        )
      ],
    );
  }
}
