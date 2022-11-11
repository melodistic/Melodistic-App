import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/forget-password.controller.dart';
import 'package:melodistic/routes.dart';
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
      child: CustomScrollView(slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding:
                const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeXXS),
            child: Form(
                key: forgetPasswordController.requestResetPasswordFormKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/forget_pwd.png'),
                            kSizedBoxVerticalM,
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
                                validate:
                                    forgetPasswordController.validateEmail)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ButtonWidget(
                            button: ButtonType.mainButton,
                            text: 'Send reset password link',
                            handleClick: () async {
                              String email = emailController.text;
                              if (forgetPasswordController
                                  .requestResetPasswordFormKey.currentState!
                                  .validate()) {
                                bool success = await forgetPasswordController
                                    .configRequestResetPassword(email);
                                if (success) {
                                  Alert.showAlert(ForgetPopup(), action: () {
                                    Get.toNamed<void>(RoutesName.validateOtp);
                                  });
                                }
                              }
                            }),
                      )
                    ])),
          ),
        )
      ]),
    );
  }
}
