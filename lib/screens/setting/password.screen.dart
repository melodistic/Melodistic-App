import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/screens/setting/widget/change-password-popup.widget.dart';
import 'package:melodistic/singleton/alert.dart';
import 'package:melodistic/widgets/common/appbar/back.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';

class SettingPasswordScreen extends StatelessWidget {
  SettingPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _confirmnewpasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        customAppbar: const BackAppbar(title: 'Change Password'),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSizeM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/forget_pwd.png'),
              kSizedBoxVerticalM,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Change Password', style: kBody2),
                    kSizedBoxVerticalS,
                    TextFieldWidget(
                        controller: _passwordController,
                        hintTitle: 'Recent Password',
                        fieldType: FieldType.password),
                    TextFieldWidget(
                        controller: _newpasswordController,
                        hintTitle: 'New Password',
                        fieldType: FieldType.password),
                    TextFieldWidget(
                        controller: _confirmnewpasswordController,
                        hintTitle: 'Confirm New Password',
                        fieldType: FieldType.password),
                  ],
                ),
              ),
              ButtonWidget(
                text: 'Save',
                handleClick: () {
                  Alert.showAlert(const ChangePasswordPopup());
                },
              )
            ],
          ),
        ));
  }
}
