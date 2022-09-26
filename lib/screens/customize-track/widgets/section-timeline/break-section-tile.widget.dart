import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/screens/customize-track/type/Section.type.dart';

class BreakSectionTile extends StatelessWidget {
  const BreakSectionTile({Key? key, required this.section}) : super(key: key);
  final Section section;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        kSizedBoxHorizontalXXS,
        kSizedBoxHorizontalS,
        const Icon(
          MelodisticIcon.coffee,
          color: kGrayScaleColor600,
        ),
        kSizedBoxHorizontalXS,
        Text(
          '${section.mood} break ${section.duration} mins',
          style: kBody3.copyWith(color: kGrayScaleColor600),
        )
      ],
    );
  }
}