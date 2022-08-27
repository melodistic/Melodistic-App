import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/radio.widget.dart';
import 'package:melodistic/widgets/common/type/section.type.dart';

class SelectSectionType extends StatelessWidget {
  const SelectSectionType(
      {Key? key, required this.value, required this.onChanged})
      : super(key: key);
  final SectionType value;
  final void Function(SectionType?) onChanged;

  Widget renderSelection(String text, SectionType selectionValue) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: kGrayScaleColor300),
            borderRadius: kBorderRadiusXXS),
        child: Row(children: <Widget>[
          RadioButton<SectionType>(
            groupValue: value,
            value: selectionValue,
            onChanged: onChanged,
          ),
          Text(
            text,
            style: kBody3Medium.copyWith(
                color: value == selectionValue
                    ? kSecondaryColor
                    : kGrayScaleColor500),
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      renderSelection('Exercise Section', SectionType.exerciseSection),
      kSizedBoxVerticalS,
      renderSelection('Break Section', SectionType.breakSection),
    ]);
  }
}
