import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/controller/processed-music.controller.dart';
import 'package:melodistic/widgets/common/bottom-sheet.widget.dart';
import 'package:melodistic/widgets/common/type/bottom-sheet.type.dart';

class DeleteSongBottomSheet extends StatelessWidget {
  DeleteSongBottomSheet(
      {Key? key,
      required this.title,
      required this.time,
      required this.processId})
      : super(key: key);
  final Widget title;
  final String time;
  final String processId;
  final ProcessedMusicController processedMusicController = Get.find();

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
        customTitle: title,
        description: time,
        actionList: <BottomSheetAction>[
          BottomSheetAction(
              title: 'Delete music',
              icon: MelodisticIcon.carbon_close_filled,
              handleClick: () async {
                await processedMusicController.deleteProcessedMusic(processId);
                await processedMusicController.fetchProcessedMusic();
                Get.back<void>();
              }),
        ]);
  }
}
