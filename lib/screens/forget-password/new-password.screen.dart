import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/popup-dialog.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      screen: ScreenType.withBack,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeXXXS),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
          Image.asset('assets/images/forget_pwd.png'),
          kSizedBoxVerticalL,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Create Your New Password',
                style: kBody2,
              ),
              TextFieldWidget(
                  fieldType: FieldType.password,
                  hintTitle: 'Password',
                  controller: passwordController,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  }),
              TextFieldWidget(
                  fieldType: FieldType.password,
                  hintTitle: 'Comfirm Password',
                  controller: passwordController,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Confirm password is required';
                    }
                    return null;
                  }),
            ],
          )),
          kSizedBoxVerticalL,
          ButtonWidget(
            button: ButtonType.mainButton,
            text: 'Continue',
            handleClick: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => PopupWidget(
                        content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          Image.asset('assets/images/check.png'),
                          const Padding(
                              padding: EdgeInsetsDirectional.only(top: kSizeM),
                              child:
                                  Text('Password Updated', style: kHeading2)),
                          const Padding(
                              padding:
                                  EdgeInsets.fromLTRB(36, kSizeXS, 36, kSizeM),
                              child: Text('Your account is ready to use.',
                                  style: kBody2)),
                          Column(
                            children: <Widget>[
                              ButtonWidget(
                                button: ButtonType.mainButton,
                                text: 'Go to homepage',
                                handleClick: () {
                                  Get.toNamed<String>(RoutesName.home);
                                },
                              )
                            ],
                          )
                        ]))),
          )
        ]),
      ),
    );
  }
}
