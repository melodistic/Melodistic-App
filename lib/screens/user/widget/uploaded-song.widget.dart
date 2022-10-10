import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/divider.widget.dart';

class UploadedSongWidget extends StatelessWidget {
  const UploadedSongWidget({Key? key, this.name, this.artist, this.time})
      : super(key: key);
  final String? name;
  final String? artist;
  final String? time;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        kSizedBoxVerticalXS,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Row(children: <Widget>[
                  Image.asset('assets/images/song.png'),
                  kSizedBoxHorizontalS,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('$name',
                          style: kBody3Medium.copyWith(color: kPrimaryColor)),
                      Text('$time',
                          style:
                              kBody3Medium.copyWith(color: kGrayScaleColor600))
                    ],
                  )
                ])),
            GestureDetector(
                child: const Icon(MelodisticIcon.menu_vertical,
                    color: kGrayScaleColor800))
          ],
        ),
        kSizedBoxVerticalXS,
        const MelodisticDivider()
      ],
    );
  }
}
