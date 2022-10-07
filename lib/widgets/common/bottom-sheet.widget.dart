import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/bottom-sheet-action.widget.dart';
import 'package:melodistic/widgets/common/divider.widget.dart';
import 'package:melodistic/widgets/common/type/bottom-sheet.type.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.actionList})
      : super(key: key);
  final String? title;
  final String? description;
  final List<BottomSheetAction>? actionList;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kSizeS * 1.5, vertical: kSizeM),
        height: kSizeXXL * 1.4,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title!, style: kHeading2),
              Text(description!,
                  style: kBody2.copyWith(color: kGrayScaleColor600)),
              kSizedBoxVerticalXS,
              const MelodisticDivider(),
              kSizedBoxVerticalXS,
              Expanded(
                child: Column(
                    children: actionList!
                        .map((BottomSheetAction item) =>
                            BottomSheetActionWidget(
                                title: item.title,
                                icon: item.icon,
                                handleClick: item.handleClick))
                        .toList()),
              )
            ]));
  }
}
