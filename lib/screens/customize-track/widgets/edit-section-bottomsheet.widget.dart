import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/screens/customize-track/type/RemovedSection.type.dart';
import 'package:melodistic/screens/customize-track/type/Section.type.dart';
import 'package:melodistic/widgets/common/bottom-sheet.widget.dart';
import 'package:melodistic/widgets/common/type/bottom-sheet.type.dart';

class EditSectionBottomSheet extends StatelessWidget {
  EditSectionBottomSheet({Key? key, required this.section}) : super(key: key);
  final Section section;
  final TrackCustomizeController trackCustomizeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
        title: section.name,
        description: 'you can edit or delete this section',
        actionList: <BottomSheetAction>[
          BottomSheetAction(
              title: 'Edit section',
              icon: MelodisticIcon.edit_filled,
              handleClick: () {}),
          BottomSheetAction(
              title: 'Remove section',
              icon: MelodisticIcon.carbon_close_filled,
              handleClick: () {
                RemovedSection removedSection =
                    trackCustomizeController.removeSection(section);
                Get.back<void>();
                final SnackBar snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.fromLTRB(
                      kSizeS * 1.25, kSizeS * 1.25, kSizeS * 1.25, kSizeL),
                  elevation: 2,
                  content: const Text('Section removed.'),
                  action: SnackBarAction(
                    textColor: kSecondaryColor,
                    label: 'Undo',
                    onPressed: () {
                      trackCustomizeController.undoSection(removedSection);
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),
        ]);
  }
}
