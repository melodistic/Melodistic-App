import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/models/processed-music.model.dart';
import 'package:melodistic/screens/customize-track/type/MoodEmoji.type.dart';
import 'package:melodistic/screens/user/widget/delete-song-bottomsheet.widget.dart';
import 'package:melodistic/utils/display.dart';
import 'package:melodistic/utils/format.dart';

class UploadedSongWidget extends StatelessWidget {
  const UploadedSongWidget({Key? key, required this.processedMusic})
      : super(key: key);
  final ProcessedMusic processedMusic;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset('assets/images/song.png'),
        kSizedBoxHorizontalS,
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(processedMusic.musicName,
                      overflow: TextOverflow.ellipsis,
                      style: kBody2.copyWith(color: kPrimaryColor)),
                ),
                kSizedBoxHorizontalXS,
                kSizedBoxHorizontalXS,
              ],
            ),
            processedMusic.bpm.isNotEmpty
                ? Row(children: <Widget>[
                    Text(processedMusic.mood,
                        style: kBody3.copyWith(color: kGrayScaleColor600)),
                    Text(
                        ' | ' +
                            double.parse(processedMusic.bpm)
                                .round()
                                .toString() +
                            ' bpm',
                        style: kBody3.copyWith(color: kGrayScaleColor600))
                  ])
                : Text('Processing',
                    style: kBody3.copyWith(color: kWarningColor)),
            Text(
                durationString(Duration(seconds: processedMusic.duration)) +
                    ' mins',
                style: kBody3Medium.copyWith(color: kGrayScaleColor800))
          ],
        )),
        if (!processedMusic.isProcessing)
          GestureDetector(
              child: const Icon(MelodisticIcon.menu_vertical,
                  color: kGrayScaleColor800),
              onTap: () {
                showMelodisticBottomSheet(
                    context,
                    DeleteSongBottomSheet(
                        processId: processedMusic.processId,
                        title: Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(right: kSizeS),
                              width: 64,
                              height: 56,
                              child: Center(
                                  child: Icon(
                                emojiFromMood(processedMusic.mood),
                                color: kGrayScaleColorWhite,
                              )),
                              decoration: BoxDecoration(
                                  color: kGrayScaleColorBlack,
                                  borderRadius:
                                      BorderRadius.circular(kSizeXXS)),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(processedMusic.musicName,
                                      overflow: TextOverflow.ellipsis,
                                      style: kHeading2.copyWith(
                                          color: kPrimaryColor)),
                                  kSizedBoxVerticalXXS,
                                  Text(
                                      double.parse(processedMusic.bpm)
                                              .round()
                                              .toString() +
                                          ' bpm | ' +
                                          durationString(Duration(
                                              seconds:
                                                  processedMusic.duration)) +
                                          ' mins',
                                      style: kBody2.copyWith(
                                          color: kGrayScaleColor600))
                                ],
                              ),
                            ),
                          ],
                        )));
              })
      ],
    );
  }
}
