import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';

class RadioButton<T> extends StatelessWidget {
  const RadioButton(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);
  final T value;
  final T groupValue;
  final void Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          unselectedWidgetColor: kGrayScaleColor300,
          disabledColor: kGrayScaleColor400),
      child: Radio<T>(
        activeColor: kSecondaryColor,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
