import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    this.controller,
    this.hintTitle,
    this.fieldType = FieldType.text,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? hintTitle;
  final FieldType fieldType;

  @override
  State<TextFieldWidget> createState() => TextFieldWidgetState();
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  bool _submitted = true;
  bool _error = false;
  bool obsecureText = true;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _error = false;
    super.dispose();
  }

  void showPassword() {
    setState(() {
      obsecureText = !obsecureText;
    });
  }

  String? get _errorText {
    String text = _controller.value.text;
    if (text.isEmpty) {
      _error = true;
      return 'Can\'t be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    String _text = _controller.value.text;
    return ValueListenableBuilder(
      valueListenable: _controller,
      builder: (context, TextEditingValue value, __) {
        return Padding(
          padding: const EdgeInsets.only(top:kSizeXS),
          child: 
          TextFormField(
            key: const Key('melodistic-textfield'),
            obscureText: widget.fieldType == FieldType.password
                ? obsecureText
                : !obsecureText,
            controller: _controller,
            onChanged: (_) => setState(() => _submitted = false),
            focusNode: _focusNode,
            decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: kSecondaryColor)),
                errorText: _submitted ? null : _errorText,
                hintText: widget.hintTitle,
                labelText: widget.hintTitle,
                labelStyle: TextStyle(color: _error ? kErrorColor : kGrayScaleColor500),
                fillColor: kSecondaryColor900,
                suffixIcon: IconButton(
                    onPressed: showPassword,
                    icon: Icon(
                      widget.fieldType == FieldType.password
                          ? (obsecureText ? MelodisticIcon.eye_off : MelodisticIcon.eye_empty)
                          : null,
                    ))),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ));
      },
    );
  }
}
