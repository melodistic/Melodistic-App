import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class ForgetPopup extends StatefulWidget {
  const ForgetPopup({Key? key}) : super(key: key);

  @override
  State<ForgetPopup> createState() => _ForgetPopupState();
}

class _ForgetPopupState extends State<ForgetPopup> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/email.png'),
          const Padding(
              padding: EdgeInsetsDirectional.only(top: kSizeM),
              child: Text('Email sent!', style: kHeading2)),
          const Padding(
              padding: EdgeInsets.fromLTRB(36, kSizeXS, 36, kSizeM),
              child: Text(
                  'You will receive an email with a link to reset your password.',
                  style: kBody2)),
          Column(
            children: <Widget>[
              pressed
                  ? ButtonWidget(
                      button: ButtonType.mainButton,
                      customContent: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              MelodisticIcon.check_circle,
                              color: kSecondaryColor,
                            ),
                            kSizedBoxHorizontalXXS,
                            Text('Already resent',
                                style: kHeading2Medium.copyWith(
                                    color: kSecondaryColor))
                          ]),
                    )
                  : ButtonWidget(
                      button: ButtonType.mainButton,
                      text: 'resend',
                      handleClick: () {
                        setState(() {
                          pressed = true;
                        });
                      }),
              ButtonWidget(
                button: ButtonType.textButton,
                text: 'Change email',
                handleClick: () {
                  Get.back<void>();
                },
              )
            ],
          )
        ]);
  }
}
