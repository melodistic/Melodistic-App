import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';

class ImportLinkPopup extends StatelessWidget {
  ImportLinkPopup({Key? key}) : super(key: key);
  final TextEditingController _linkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFieldWidget(
          controller: _linkController,
          hintTitle: 'URL',
          fieldType: FieldType.text,
        ),
        kSizedBoxVerticalS,
        ButtonWidget(
          button: ButtonType.mainButton,
          text: 'Add',
          handleClick: () {
            Get.back<void>();
          },
        )
      ],
    );
  }
}
