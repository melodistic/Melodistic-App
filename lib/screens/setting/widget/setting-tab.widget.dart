import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';

class SettingTabWidget extends StatelessWidget {
  const SettingTabWidget(
      {Key? key, required this.title, required this.handleClick})
      : super(key: key);
  final String title;
  final VoidCallback handleClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: handleClick,
        title: Text(title, style: kBody2.copyWith(color: kGrayScaleColorBlack)),
        trailing: const Icon(MelodisticIcon.chevron_right,
            color: kGrayScaleColorBlack));
  }
}
