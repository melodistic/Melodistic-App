import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';

class StartIndicator extends StatelessWidget {
  const StartIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kSizedBoxHorizontalM,
        Column(children: [
          kSizedBoxVerticalXXS,
          Container(
            width: kSizeXS * 1.5,
            height: kSizeXS * 1.5,
            decoration: BoxDecoration(
                color: kGrayScaleColorBlack,
                borderRadius: BorderRadius.circular(kSizeXXS * 1.5)),
          ),
          Container(
            width: 1,
            height: kSizeM,
            color: kGrayScaleColorBlack,
          )
        ]),
        kSizedBoxHorizontalXS,
        const Text(
          'Start',
          style: kHeading3,
        )
      ],
    );
  }
}
