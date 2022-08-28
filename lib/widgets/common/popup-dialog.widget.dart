import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';

class PopupWidget extends StatelessWidget {
  const PopupWidget({Key? key, this.content}) : super(key: key);
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(kSizeXS))),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: kSizeS, vertical: kSizeM),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Get.back<void>();
                },
                child: const Icon(
                  MelodisticIcon.cross,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          content!,
        ]);
  }
}
