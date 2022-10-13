import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class SettingTabWidget extends StatelessWidget {
  const SettingTabWidget(
      {Key? key, required this.title, required this.handleClick})
      : super(key: key);
  final String title;
  final VoidCallback handleClick;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
        handleClick: handleClick,
        button: ButtonType.textButton,
        customContent: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, style: kBody2.copyWith(color: kGrayScaleColorBlack)),
            const Icon(MelodisticIcon.chevron_right,
                color: kGrayScaleColorBlack)
          ],
        ));
  }
}
