import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/type/option-item.type.dart';

class ScrollableSelectWidget extends StatelessWidget {
  ScrollableSelectWidget(
      {Key? key,
      required this.onChange,
      required this.options,
      required this.value})
      : super(key: key);
  final Function onChange;
  final List<OptionItem> options;
  final OptionItem value;
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Row(
        children: options
            .map((OptionItem tab) => GestureDetector(
                  child: Container(
                      margin: const EdgeInsets.only(right: kSizeXS),
                      padding: const EdgeInsets.symmetric(
                          vertical: kSizeXS, horizontal: kSizeS),
                      decoration: BoxDecoration(
                        color: tab.id == value.id
                            ? kSecondaryColor
                            : kGrayScaleColor200,
                        borderRadius: kBorderRadiusXXS,
                      ),
                      child: Text(
                        tab.label,
                        style: tab.id == value.id
                            ? kBody3SemiBold.copyWith(
                                color: kGrayScaleColorWhite)
                            : kBody3.copyWith(color: kGrayScaleColor600),
                      )),
                  onTap: () {
                    onChange(tab, scrollController);
                  },
                ))
            .toList(),
      ),
      scrollDirection: Axis.horizontal,
    );
  }
}
