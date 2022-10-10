import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/widgets/common/bottom-sheet.widget.dart';
import 'package:melodistic/widgets/common/type/bottom-sheet.type.dart';

class TrackSettingBottomSheet extends StatelessWidget {
  TrackSettingBottomSheet({Key? key}) : super(key: key);
  final TrackCustomizeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
        title: 'Track setting',
        description: 'you can edit or delete this track',
        actionList: <BottomSheetAction>[
          BottomSheetAction(
              title: 'Edit track',
              icon: MelodisticIcon.edit_filled,
              handleClick: () {}),
          BottomSheetAction(
              title: 'Delete track',
              icon: MelodisticIcon.carbon_close_filled,
              handleClick: () {
                Navigator.pop(context);
              }),
        ]);
  }
}
