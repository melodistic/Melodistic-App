import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/screens/customize-track/type/Section.type.dart';
import 'package:melodistic/screens/customize-track/widgets/edit-section-bottomsheet.widget.dart';

class BreakSectionTile extends StatelessWidget {
  const BreakSectionTile({Key? key, required this.section}) : super(key: key);
  final Section section;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: kSizeXS, vertical: kSizeXXS),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
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
            )),
            IconButton(
              icon: const Icon(
                MelodisticIcon.menu_vertical,
                color: kGrayScaleColor700,
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kSizeS * 1.25),
                          topRight: Radius.circular(kSizeS * 1.25)),
                    ),
                    builder: (BuildContext context) {
                      return EditSectionBottomSheet(title: section.mood);
                    });
              },
            ),
          ],
        ));
  }
}
