import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/routes.dart';

class BackAppbar extends StatelessWidget with PreferredSizeWidget {
  const BackAppbar({Key? key, required this.title, this.customAction})
      : super(key: key);

  final String title;
  final VoidCallback? customAction;

  @override
  Size get preferredSize => const Size.fromHeight(kSizeL);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: const Key('melodistic-appbar'),
      title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSizeS),
          child: SizedBox(
              child: GestureDetector(
                  onTap: customAction ??
                      () {
                        if (Get.routing.route == null ||
                            Get.routing.route!.isFirst) {
                          Get.toNamed<void>(RoutesName.home);
                        } else {
                          Get.back<void>();
                        }
                      },
                  child: Row(children: <Widget>[
                    const Icon(
                      MelodisticIcon.chevron_left,
                      color: kPrimaryColor,
                      size: kSizeM,
                    ),
                    Text(
                      title,
                      style: kBody1Medium.copyWith(color: kPrimaryColor),
                    )
                  ])))),
      elevation: 0,
      titleSpacing: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: kTransparent,
    );
  }
}
