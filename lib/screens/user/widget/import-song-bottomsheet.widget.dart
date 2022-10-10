import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/screens/user/widget/import-link-popup.widget.dart';
import 'package:melodistic/singleton/alert.dart';
import 'package:melodistic/widgets/common/bottom-sheet.widget.dart';
import 'package:melodistic/widgets/common/type/bottom-sheet.type.dart';

class ImportSongBottomSheet extends StatelessWidget {
  ImportSongBottomSheet({Key? key}) : super(key: key);
  final TrackCustomizeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
        title: 'Import media',
        description:
            'To import media from the Files app and select them here to add to your upload or enter a youtube link.',
        actionList: <BottomSheetAction>[
          BottomSheetAction(
              title: 'Import from your files',
              icon: MelodisticIcon.list_add,
              handleClick: () {}),
          BottomSheetAction(
              title: 'Import from youtube link',
              icon: MelodisticIcon.play,
              handleClick: () {
                Alert.showAlert(ImportLinkPopup());
              }),
        ]);
  }
}
