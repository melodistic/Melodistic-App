import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';

class MainActionAppbar extends StatelessWidget with PreferredSizeWidget {
  const MainActionAppbar({Key? key, required this.title, required this.action})
      : super(key: key);

  final String title;
  final Widget action;

  @override
  Size get preferredSize => const Size.fromHeight(kSizeL);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: const Key('melodistic-appbar'),
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSizeS),
        child: GestureDetector(
          child: const Icon(
            MelodisticIcon.menu_hamburger,
            color: kGrayScaleColorBlack,
            size: kSizeM,
          ),
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: Text(
        title,
        style: kBody1Medium.copyWith(color: kPrimaryColor),
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
