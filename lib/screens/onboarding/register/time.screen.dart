import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/screens/customize-track/widgets/customtime-picker.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class RegisterTimeScreen extends StatelessWidget {
  const RegisterTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      screen: ScreenType.noTitle,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kSizeM, kSizeXL, kSizeM, kSizeXS),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSizeS),
            child: Text(
                'Choose the music track for you based on the amount of time you spend exercising.',
                style: kBody2.copyWith(color: kGrayScaleColor600)),
          ),
          kSizedBoxM,
          Container(
              color: kGrayScaleColor200,
              height: 160,
              width: 327,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: kSizeXS),
                      child: Text(
                        'Exercise Duration',
                        style: kHeading2.copyWith(color: kPrimaryColor),
                      )),
                  const CustomTimePicker()
                ],
              )),
          kSizedBoxXXL,
          const ButtonWidget(
            button: ButtonType.mainButton,
            text: 'Done',
          ),
          const ButtonWidget(button: ButtonType.textButton, text: 'Not now')
        ]),
      ),
    );
  }
}
