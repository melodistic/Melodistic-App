import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';

class ConnectorLine extends StatelessWidget {
  const ConnectorLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kSizedBoxHorizontalM,
        Column(children: [
          const SizedBox(
            width: kSizeXS * 1.5,
          ),
          Container(
            width: 1,
            height: kSizeM,
            color: kGrayScaleColorBlack,
          )
        ]),
      ],
    );
  }
}
