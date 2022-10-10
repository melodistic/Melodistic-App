import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/widgets/common/bottom-sheet.widget.dart';
import 'package:melodistic/widgets/common/type/bottom-sheet.type.dart';

class DeleteSongBottomSheet extends StatefulWidget {
  const DeleteSongBottomSheet(
      {Key? key, required this.title, required this.time})
      : super(key: key);
  final String title;
  final String time;

  @override
  State<DeleteSongBottomSheet> createState() => _DeleteSongBottomSheet();
}

class _DeleteSongBottomSheet extends State<DeleteSongBottomSheet> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
        title: widget.title,
        description: widget.time,
        actionList: <BottomSheetAction>[
          BottomSheetAction(
              title: 'Delete music',
              icon: MelodisticIcon.carbon_close_filled,
              handleClick: () {
                Get.back<void>();
                final SnackBar snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.fromLTRB(
                      kSizeS * 1.25, kSizeS * 1.25, kSizeS * 1.25, kSizeL),
                  elevation: 2,
                  content: const Text('Music removed.'),
                  action: SnackBarAction(
                    textColor: kSecondaryColor,
                    label: 'Undo',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),
        ]);
  }
}
