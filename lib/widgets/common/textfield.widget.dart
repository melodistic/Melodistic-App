import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
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
  String? _errorText;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void showPassword() {
    setState(() {
      obsecureText = !obsecureText;
    });
  }

  void handleChange(String value) {
    if (widget.validate != null) {
      setState(() {
        _errorText = widget.validate!(_controller.value.text);
      });
    }
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
          controller: _controller,
          onChanged: handleChange,
          focusNode: _focusNode,
          decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: kSecondaryColor)),
              errorText: _errorText,
              hintText: widget.hintTitle,
              labelText: widget.hintTitle,
              labelStyle: TextStyle(
                  color: _errorText != null ? kErrorColor : kGrayScaleColor500),
              fillColor: kSecondaryColor900,
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
