import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/forget-password.controller.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class ForgetSuccessPopup extends StatelessWidget {
  ForgetSuccessPopup({Key? key}) : super(key: key);

  final ForgetPasswordController forgetPasswordController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/check.png'),
          const Padding(
              padding: EdgeInsetsDirectional.only(top: kSizeM),
              child: Text('Password Updated', style: kHeading2)),
          const Padding(
              padding: EdgeInsets.fromLTRB(36, kSizeXS, 36, kSizeM),
              child: Text('Your account is ready to use.', style: kBody2)),
          Column(
            children: <Widget>[
              ButtonWidget(
                button: ButtonType.mainButton,
                text: 'Go to homepage',
                handleClick: () {
                  Get.offAllNamed<dynamic>(RoutesName.home);
                },
              )
            ],
          )
        ]);
  }
}
