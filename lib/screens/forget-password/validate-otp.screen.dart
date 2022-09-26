import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class ValidateOtpScreen extends StatelessWidget {
  ValidateOtpScreen({Key? key}) : super(key: key);
  final TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      screen: MelodisticScreenType.withBack,
      child: Padding(
        padding:
            const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeS * 1.5, kSizeXXXS),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/forget_pwd.png'),
              kSizedBoxVerticalL,
              const Padding(
                  padding: EdgeInsets.only(right: kSizeM),
                  child: Text(
                    'A One Time Passcode has been sent to username@email.com',
                    style: kBody2,
                  )),
              kSizedBoxVerticalS,
              const Text(
                'Please check your e-mail and enter the OTP below to verify your email address. If you cannot see the email, make sure to check your SPAM folder.',
                style: kBody2,
              ),
              TextFieldWidget(
                  hintTitle: 'OTP',
                  controller: otpController,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'OTP is required';
                    }
                    return null;
                  }),
              kSizedBoxVerticalL,
              const ButtonWidget(button: ButtonType.mainButton, text: 'Verify')
            ]),
      ),
    );
  }
}
