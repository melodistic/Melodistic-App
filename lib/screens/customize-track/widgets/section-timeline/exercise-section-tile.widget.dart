import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/screens/customize-track/type/Section.type.dart';
import 'package:melodistic/screens/customize-track/widgets/edit-section-bottomsheet.widget.dart';
import 'package:melodistic/utils/display.dart';

class ExerciseSectionTile extends StatelessWidget {
  const ExerciseSectionTile(
      {Key? key, required this.section, required this.index})
      : super(key: key);
  final Section section;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: kSizeXS * 1.5, horizontal: kSizeXS),
      decoration: BoxDecoration(
          color: kGrayScaleColorWhite,
          borderRadius: BorderRadius.circular(kSizeXXS),
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 14,
                color: kGrayScaleColor600.withOpacity(0.12))
          ]),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Container(
          width: 64,
          height: 56,
          child: const Center(
              child: Icon(
            MelodisticIcon.emoji_look_top,
            color: kGrayScaleColorWhite,
          )),
          decoration: BoxDecoration(
              color: kGrayScaleColorBlack,
              borderRadius: BorderRadius.circular(kSizeXXS)),
        ),
        kSizedBoxHorizontalS,
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              section.name,
              style: kHeading3.copyWith(color: kSecondaryColor),
            ),
            Text('${section.exerciseType}, ${section.mood}',
                style: kBody3.copyWith(color: kGrayScaleColor600)),
            Text(
              '${section.duration} mins',
              style: kBody3.copyWith(color: kGrayScaleColor600),
            ),
          ],
        )),
        kSizedBoxHorizontalS,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                MelodisticIcon.menu_vertical,
                color: kGrayScaleColor700,
              ),
              onPressed: () {
                showMelodisticBottomSheet(
                    context,
                    EditSectionBottomSheet(
                      title: section.name,
                      index: index,
                    ));
              },
            ),
          ],
        )
      ]),
    );
  }
}
