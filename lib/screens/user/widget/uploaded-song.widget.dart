import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/screens/user/widget/delete-song-bottomsheet.widget.dart';
import 'package:melodistic/screens/user/widget/uploaded-status.widget.dart';
import 'package:melodistic/utils/display.dart';
import 'package:melodistic/widgets/common/divider.widget.dart';

class UploadedSongWidget extends StatelessWidget {
  const UploadedSongWidget(
      {Key? key,
      required this.name,
      required this.time,
      required this.isProcessing})
      : super(key: key);
  final String? name;
  final String? time;
  final bool isProcessing;
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
                child: Row(children: <Widget>[
              Image.asset('assets/images/song.png'),
              kSizedBoxHorizontalS,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: kSizeXL,
                        child: Text(name!,
                            overflow: TextOverflow.ellipsis,
                            style: kBody3Medium.copyWith(color: kPrimaryColor)),
                      ),
                      kSizedBoxHorizontalXS,
                      UploadedStatusWidget(isProcessing: isProcessing)
                    ],
                  ),
                  Text(time!,
                      style: kBody3Medium.copyWith(color: kGrayScaleColor600))
                ],
              ))
            ])),
            GestureDetector(
                child: const Icon(MelodisticIcon.menu_vertical,
                    color: kGrayScaleColor800),
                onTap: () {
                  showMelodisticBottomSheet(context,
                      DeleteSongBottomSheet(title: name!, time: time!));
                })
          ],
        ),
        kSizedBoxVerticalXS,
        const MelodisticDivider()
      ],
    );
  }
}
