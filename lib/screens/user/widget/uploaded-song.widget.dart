import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/models/processed-music.model.dart';
import 'package:melodistic/screens/user/widget/delete-song-bottomsheet.widget.dart';
import 'package:melodistic/screens/user/widget/uploaded-status.widget.dart';
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
        GestureDetector(
            child: const Icon(MelodisticIcon.menu_vertical,
                color: kGrayScaleColor800),
            onTap: () {
              showMelodisticBottomSheet(
                  context,
                  DeleteSongBottomSheet(
                      processId: processedMusic.processId,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: kSizeXL,
                            child: Text(processedMusic.musicName,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    kHeading2.copyWith(color: kPrimaryColor)),
                          ),
                          UploadedStatusWidget(
                              isProcessing: processedMusic.isProcessing)
                        ],
                      ),
                      time: durationString(
                              Duration(seconds: processedMusic.duration)) +
                          ' mins '));
            })
      ],
    );
  }
}
