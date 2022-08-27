import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';

class MelodisticCheckBox<T> extends StatelessWidget {
  const MelodisticCheckBox(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);
  final T value;
  final List<T> groupValue;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            unselectedWidgetColor: kGrayScaleColor300,
            disabledColor: kGrayScaleColor400),
        child: Checkbox(
            activeColor: kSecondaryColor,
            checkColor: kGrayScaleColor50,
            value: groupValue.contains(value),
            onChanged: onChanged));
  }
}
