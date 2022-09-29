import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';

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
      leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSizeS),
          child: SizedBox(
              child: GestureDetector(
                  onTap: customAction ??
                      () {
                        Get.back<void>();
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
      leadingWidth: double.infinity,
      elevation: 0,
      backgroundColor: kTransparent,
    );
  }
}
