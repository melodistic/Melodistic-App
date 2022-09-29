import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/forget-password.controller.dart';
import 'package:melodistic/screens/forget-password/widgets/forget-popup.widget.dart';
import 'package:melodistic/singleton/alert.dart';
import 'package:melodistic/widgets/common/appbar/back.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final ForgetPasswordController forgetPasswordController = Get.find();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      customAppbar: const BackAppbar(title: 'Forget Password'),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeXXXS),
        child: Form(
            key: forgetPasswordController.customizeFormKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
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
                            fieldType: FieldType.text,
                            validate: forgetPasswordController.validateEmail)
                      ],
                    ),
                  ),
                  ButtonWidget(
                      button: ButtonType.mainButton,
                      text: 'Send reset password link',
                      handleClick: () {
                        if (forgetPasswordController
                            .customizeFormKey.currentState!
                            .validate()) {
                          Alert.showAlert(const ForgetPopup());
                        }
                      })
                ])),
      ),
    );
  }
}
