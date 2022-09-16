import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/screens/forget-password/widgets/forget-popup.widget.dart';
import 'package:melodistic/singleton/alert.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      screen: MelodisticScreenType.withBack,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeXXXS),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/forget_pwd.png'),
              kSizedBoxVerticalL,
              const Padding(
                  padding: EdgeInsets.only(right: kSizeM),
                  child: Text(
                    "Provide your account's email for which you want to reset your password",
                    style: kBody2,
                  )),
              TextFieldWidget(
                  hintTitle: 'Email',
                  controller: emailController,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  }),
              kSizedBoxVerticalXXL,
              ButtonWidget(
                  button: ButtonType.mainButton,
                  text: 'Send reset password link',
                  handleClick: () => Alert.showAlert(const ForgetPopup()))
            ]),
      ),
    );
  }
}
