import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/screens/customize-track/type/MoodEmoji.type.dart';
import 'package:melodistic/widgets/common/bottom-sheet-action.widget.dart';
import 'package:melodistic/widgets/common/divider.widget.dart';
import 'package:melodistic/widgets/common/type/bottom-sheet.type.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget(
      {Key? key,
      this.title,
      this.size = BottomSheetSize.small,
      this.description = '',
      required this.actionList,
      this.customTitle})
      : super(key: key);
  final BottomSheetSize? size;
  final String? title;
  final String description;
  final List<BottomSheetAction> actionList;
  final Widget? customTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: kSizeS * 1.5,
            vertical: size == BottomSheetSize.large ? kSizeM : kSizeXS),
        height: size == BottomSheetSize.large ? kSizeXXL * 1.4 : kSizeXXL,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              customTitle ?? Text(title!, style: kHeading2),
              kSizedBoxVerticalXXS,
              Text(description,
                  style: kBody2.copyWith(color: kGrayScaleColor600)),
              kSizedBoxVerticalXS,
              const MelodisticDivider(),
              kSizedBoxVerticalXS,
              ...actionList
                  .map((BottomSheetAction item) => BottomSheetActionWidget(
                      title: item.title,
                      icon: item.icon,
                      handleClick: item.handleClick))
                  .toList()
            ]));
  }
}
