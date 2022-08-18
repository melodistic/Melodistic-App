import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/iconoir.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
    {Key? key,
    this.controller,
    this.hintTitle,
    this.fieldType = FieldType.text,}
  ):super(key: key);
  final TextEditingController? controller;
  final String? hintTitle;
  final FieldType fieldType;

  @override
  State<TextFieldWidget> createState() => _FormState();
}
class _FormState extends State<TextFieldWidget>{
  bool _submitted = true;
  bool obsecureText = true;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showPassword(){
    setState(() {
      obsecureText = !obsecureText;
    });
  }
  String? get _errorText {
    String text = _controller.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
}


  @override
  Widget build(BuildContext context) {
    String  _text = _controller.value.text;
    return ValueListenableBuilder(
    valueListenable: _controller,
    builder: (context, TextEditingValue value, __) {
      return TextFormField(
          key: const Key('melodistic-textfield'),
          obscureText: widget.fieldType == FieldType.password ? obsecureText : !obsecureText,
          controller: _controller,
          onChanged: (_) => setState(() => _submitted = false),
          decoration: InputDecoration(
              errorText: _submitted ? null : _errorText,
              hintText: widget.hintTitle,
              labelText: widget.hintTitle,
              fillColor: kSecondaryColor900,
              suffixIcon: IconButton(
                onPressed: showPassword,
                icon:  Icon(
                  widget.fieldType == FieldType.password ? (obsecureText ? Iconoir.eye_off : Iconoir.eye_empty) : null,
                ) 
              )),
          onSaved: (String? value) {
            // This optional block of code can be used to run
            // code when the user saves the form.
          },
          validator: (String? value) {
            return (value != null && value.contains('@'))
                ? 'Do not use the @ char.'
                : null;
          },
        );
    },
    );
  }
}