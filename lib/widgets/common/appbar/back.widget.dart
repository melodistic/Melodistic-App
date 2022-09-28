import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';

class BackAppbar extends StatelessWidget with PreferredSizeWidget {
  const BackAppbar({Key? key, required this.title}) : super(key: key);

  final String title;

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
