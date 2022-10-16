import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {Key? key,
      this.controller,
      this.hintTitle,
      this.fieldType = FieldType.text,
      this.validate})
      : super(key: key);
  final TextEditingController? controller;
  final String? hintTitle;
  final FieldType fieldType;
  final ValidateFunction? validate;

  @override
  State<TextFieldWidget> createState() => TextFieldWidgetState();
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  bool obsecureText = true;

  void showPassword() {
    setState(() {
      obsecureText = !obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: kSizeXS),
        child: TextFormField(
          cursorColor: kGrayScaleColor500,
          key: const Key('melodistic-textfield'),
          obscureText: widget.fieldType == FieldType.password
              ? obsecureText
              : !obsecureText,
          controller: widget.controller,
          validator: widget.validate,
          decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: kSecondaryColor)),
              hintText: widget.hintTitle,
              labelText: widget.hintTitle,
              hintStyle: kBody2.copyWith(color: kGrayScaleColor600),
              labelStyle: kBody2.copyWith(color: kGrayScaleColor500),
              errorStyle: kBody2.copyWith(color: kErrorColor),
              fillColor: kSecondaryColor,
              suffixIcon: IconButton(
                  onPressed: showPassword,
                  icon: Icon(
                    widget.fieldType == FieldType.password
                        ? (obsecureText
                            ? MelodisticIcon.eye_off
                            : MelodisticIcon.eye_empty)
                        : null,
                    color: kGrayScaleColorBlack,
                  ))),
        ));
  }
}
