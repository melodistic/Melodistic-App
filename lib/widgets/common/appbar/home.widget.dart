import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';

class HomeAppbar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppbar({Key? key}) : super(key: key);

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
              color: kGrayScaleColor900,
              size: kSizeM,
            ),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          'Melodistic',
          style: TextStyle(color: kGrayScaleColor900),
        ),
        elevation: 0,
        backgroundColor: kGrayScaleColor50);
  }
}
