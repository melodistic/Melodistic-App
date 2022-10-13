import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class ChangePasswordPopup extends StatelessWidget {
  const ChangePasswordPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/check.png'),
          const Padding(
              padding: EdgeInsetsDirectional.only(top: kSizeM),
              child: Text('Password Updated', style: kHeading2)),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(kSizeXS, kSizeXS, kSizeXS, kSizeM),
              child: Text('Your password has been change.',
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
