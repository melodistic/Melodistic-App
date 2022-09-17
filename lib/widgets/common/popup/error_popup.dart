import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class ErrorPopup extends StatelessWidget {
  const ErrorPopup({Key? key, this.errorMessage}) : super(key: key);
  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/warning.png'),
          kSizedBoxVerticalS,
          Text(errorMessage ?? 'Doh! Something went wrong', style: kHeading2),
          kSizedBoxVerticalXXS,
          const Text('Please, try this action again.', style: kBody2),
          kSizedBoxVerticalM,
          ButtonWidget(
              button: ButtonType.mainButton,
              text: 'Ok',
              handleClick: () {
                Get.back<void>();
              }),
        ]);
  }
}
