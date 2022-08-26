import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class RadioCheckboxWidget extends StatefulWidget {
  const RadioCheckboxWidget({Key? key, this.type = CheckType.radio})
      : super(key: key);
  final CheckType type;

  @override
  State<RadioCheckboxWidget> createState() => _RadioCheckboxWidgetState();
}

class _RadioCheckboxWidgetState extends State<RadioCheckboxWidget> {
  SectionType? _text = SectionType.none;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            unselectedWidgetColor: kGrayScaleColor300,
            disabledColor: kGrayScaleColor400),
        child: widget.type == CheckType.radio
            ? Column(children: <Widget>[
                ListTile(
                  title: Text(
                    'Exercise Section',
                    style: kBody3Medium.copyWith(
                        color: _text == SectionType.exerciseSection
                            ? kSecondaryColor
                            : kGrayScaleColor500),
                  ),
                  leading: Radio<SectionType>(
                    activeColor: kSecondaryColor,
                    value: SectionType.exerciseSection,
                    groupValue: _text,
                    onChanged: (SectionType? value) {
                      setState(() {
                        _text = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Break Section',
                    style: kBody3Medium.copyWith(
                        color: _text == SectionType.breakSection
                            ? kSecondaryColor
                            : kGrayScaleColor500),
                  ),
                  leading: Radio<SectionType>(
                    activeColor: kSecondaryColor,
                    value: SectionType.breakSection,
                    groupValue: _text,
                    onChanged: (SectionType? value) {
                      setState(() {
                        _text = value;
                      });
                    },
                  ),
                )
              ])
            : Checkbox(
                activeColor: kSecondaryColor,
                checkColor: kGrayScaleColor50,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                }));
  }
}
