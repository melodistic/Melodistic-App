import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/widgets/common/bottom-sheet.widget.dart';
import 'package:melodistic/widgets/common/type/bottom-sheet.type.dart';
import 'package:melodistic/widgets/common/type/section.type.dart';

class SectionBottomSheet extends StatelessWidget {
  SectionBottomSheet({Key? key}) : super(key: key);
  final TrackCustomizeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
        size: BottomSheetSize.large,
        title: 'Add section type',
        description: 'Relax and walk around by adding some exercise breaks.',
        actionList: <BottomSheetAction>[
          BottomSheetAction(
              title: 'Add exercise section',
              icon: MelodisticIcon.running,
              handleClick: () {
                controller.selectNewSectionType(SectionType.exerciseSection);
              }),
          BottomSheetAction(
              title: 'Add Break section',
              icon: MelodisticIcon.coffee,
              handleClick: () {
                controller.selectNewSectionType(SectionType.breakSection);
              }),
        ]);
  }
}
