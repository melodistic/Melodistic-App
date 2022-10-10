import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/controller/track.controller.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/bottom-sheet.widget.dart';
import 'package:melodistic/widgets/common/type/bottom-sheet.type.dart';

class TrackSettingBottomSheet extends StatelessWidget {
  TrackSettingBottomSheet({Key? key, required this.trackId}) : super(key: key);
  final String? trackId;
  final TrackController controller = Get.find();

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
              handleClick: () async {
                await controller.deleteTrack(trackId);
                if (Get.currentRoute == RoutesName.library) {
                  await controller.fetchLibraryTrack();
                } else if (Get.currentRoute == RoutesName.favorite) {
                  await controller.fetchFavoriteTracks();
                }
                Get.back<void>();
              }),
        ]);
  }
}
