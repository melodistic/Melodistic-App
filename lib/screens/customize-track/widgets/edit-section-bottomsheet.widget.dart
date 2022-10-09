import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/widgets/common/bottom-sheet.widget.dart';
import 'package:melodistic/widgets/common/type/bottom-sheet.type.dart';

class EditSectionBottomSheet extends StatefulWidget {
  const EditSectionBottomSheet({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<EditSectionBottomSheet> createState() => _EditSectionBottomSheetState();
}

class _EditSectionBottomSheetState extends State<EditSectionBottomSheet> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
        title: widget.title,
        description: 'you can edit or delete this section',
        actionList: <BottomSheetAction>[
          BottomSheetAction(
              title: 'Edit section',
              icon: MelodisticIcon.edit_filled,
              handleClick: () {}),
          BottomSheetAction(
              title: 'Remove section',
              icon: MelodisticIcon.cross,
              handleClick: () {
                Navigator.pop(context);
                final SnackBar snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.fromLTRB(
                      kSizeS * 1.25, kSizeS * 1.25, kSizeS * 1.25, kSizeL),
                  elevation: 2,
                  content: const Text('Section removed.'),
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
