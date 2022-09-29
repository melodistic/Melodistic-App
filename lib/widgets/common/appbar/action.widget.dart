import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';

class ActionAppbar extends StatelessWidget with PreferredSizeWidget {
  const ActionAppbar(
      {Key? key,
      required this.title,
      required this.action,
      this.color = kGrayScaleColorWhite})
      : super(key: key);

  final String title;
  final Widget action;
  final Color color;

  @override
  Size get preferredSize => const Size.fromHeight(kSizeL);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: const Key('melodistic-appbar'),
      leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSizeS),
          child: SizedBox(
              child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MelodisticIcon.chevron_left,
              color: color,
            ),
          ))),
      title: Text(
        title,
        style: kBody1Medium.copyWith(color: color),
      ),
      actions: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSizeS),
            child: action)
      ],
      elevation: 0,
      backgroundColor: kTransparent,
    );
  }
}
