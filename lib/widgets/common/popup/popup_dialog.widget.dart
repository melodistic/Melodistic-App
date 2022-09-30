import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';

class PopupWidget extends StatelessWidget {
  const PopupWidget({Key? key, this.content, this.action}) : super(key: key);
  final Widget? content;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(kSizeXS))),
        contentPadding: const EdgeInsets.all(kSizeS * 1.5),
        children: <Widget>[
          SizedBox(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: action ??
                        () {
                          Get.back<void>();
                        },
                    child: const Icon(
                      MelodisticIcon.cross,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              )),
          content!,
        ]);
  }
}
