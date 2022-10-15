import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/controller/processed-music.controller.dart';
import 'package:melodistic/controller/track-customize.controller.dart';
import 'package:melodistic/screens/user/widget/confirm-upload-popup.widget.dart';
import 'package:melodistic/screens/user/widget/import-link-popup.widget.dart';
import 'package:melodistic/singleton/alert.dart';
import 'package:melodistic/utils/file.dart';
import 'package:melodistic/widgets/common/bottom-sheet.widget.dart';
import 'package:melodistic/widgets/common/type/bottom-sheet.type.dart';

class ImportSongBottomSheet extends StatefulWidget {
  const ImportSongBottomSheet({Key? key}) : super(key: key);

  @override
  State<ImportSongBottomSheet> createState() => _ImportSongBottomSheetState();
}

class _ImportSongBottomSheetState extends State<ImportSongBottomSheet> {
  final TrackCustomizeController controller = Get.find();
  final ProcessedMusicController processedMusicController = Get.find();

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
              handleClick: () async {
                File? file = await getMusicFile();
                if (file != null) {
                  processedMusicController.setProcessedSongFile(file);
                  Alert.showAlert(ConfirmUploadPopup(
                    source: 'Music',
                    title: file.path.split('/').last,
                    handleClick: () async {
                      Get.back<void>();
                      Get.back<void>();
                      // TODO: show loading animation here
                      bool success =
                          await processedMusicController.processedFile();
                      if (success) {
                        processedMusicController.fetchProcessedMusic();
                      }
                    },
                  ));
                }
              }),
          BottomSheetAction(
              title: 'Import from youtube link',
              icon: MelodisticIcon.play,
              handleClick: () {
                Alert.showAlert(ImportLinkPopup());
              }),
        ]);
  }
}
