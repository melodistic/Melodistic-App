import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class SettingSuccessPopup extends StatelessWidget {
  const SettingSuccessPopup(
      {Key? key, required this.title, required this.description})
      : super(key: key);
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/check.png'),
          Padding(
              padding: const EdgeInsetsDirectional.only(top: kSizeM),
              child: Text(title, style: kHeading2)),
          Padding(
              padding: const EdgeInsets.fromLTRB(
                  kSizeXXS, kSizeXS, kSizeXXS, kSizeM),
              child: Text(description,
                  textAlign: TextAlign.center,
                  style: kBody2.copyWith(color: kGrayScaleColor600))),
          Column(
            children: <Widget>[
              ButtonWidget(
                button: ButtonType.mainButton,
                text: 'Done',
                handleClick: () {
                  Get.toNamed<dynamic>(RoutesName.setting);
                },
              )
            ],
          )
        ]);
  }
}
