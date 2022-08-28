import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class AlternativeAppbar extends StatelessWidget with PreferredSizeWidget {
  AlternativeAppbar({Key? key, required this.screen, this.text})
      : super(key: key);

  final ScreenType screen;
  final String? text;

  @override
  Size get preferredSize => const Size.fromHeight(kSizeL);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: const Key('melodistic-appbar'),
      leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSizeS),
          child: screen == ScreenType.noTitle
              ? null
              : SizedBox(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(children: <Widget>[
                        const Icon(
                          MelodisticIcon.chevron_left,
                          color: kPrimaryColor,
                        ),
                        Text(
                          '$text',
                          style: const TextStyle(
                              color: kPrimaryColor, fontSize: kFontSizeM),
                        )
                      ])))),
      leadingWidth: double.infinity,
      elevation: 0,
      backgroundColor: kGrayScaleColorWhite,
    );
  }
}
