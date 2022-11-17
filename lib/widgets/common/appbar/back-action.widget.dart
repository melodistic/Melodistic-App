import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/player.controller.dart';
import 'package:melodistic/routes.dart';

class BackActionAppbar extends StatelessWidget with PreferredSizeWidget {
  BackActionAppbar(
      {Key? key,
      required this.title,
      required this.action,
      this.color = kGrayScaleColorWhite,
      this.isCustomBackAction = false})
      : super(key: key);

  final String title;
  final Widget action;
  final Color color;
  final bool isCustomBackAction;
  final PlayerController playerController = Get.find();

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
              if (isCustomBackAction) {
                playerController.stop();
                Get.back<void>();
              }
              if (Get.routing.route == null || Get.routing.route!.isFirst) {
                Get.toNamed<void>(RoutesName.home);
              } else {
                Get.back<void>();
              }
              ;
            },
            child: Icon(
              MelodisticIcon.chevron_left,
              color: color,
              size: kSizeM,
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
