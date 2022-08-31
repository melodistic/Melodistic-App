import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';

class TimerPickerItem extends StatelessWidget {
  const TimerPickerItem({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kSizeXS),
      height: 54,
      width: 287,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: kGrayScaleColorWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
