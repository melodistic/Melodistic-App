import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';

class MelodisticDivider extends StatelessWidget {
  const MelodisticDivider({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: kGrayScaleColor200,
    );
  }
}
