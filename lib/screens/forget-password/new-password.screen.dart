import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/forget-password.controller.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/screens/forget-password/widgets/success-popup.widget.dart';
import 'package:melodistic/singleton/alert.dart';
import 'package:melodistic/widgets/common/appbar/back.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final ForgetPasswordController forgetPasswordController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      customAppbar: BackAppbar(
        title: 'Create New Password',
        customAction: () {
          Get.back<void>();
          Get.back<void>();
          Get.back<void>();
          Get.back<void>();
        },
      ),
      child: CustomScrollView(slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding:
                const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeXXS),
            child: Form(
                key: forgetPasswordController.newPasswordFormKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/forget_pwd.png',
                                height: 200,
                              ),
                            ],
                          ),
                          kSizedBoxVerticalM,
                          const Text(
                            'Create Your New Password',
                            style: kBody2,
                          ),
                          TextFieldWidget(
                              fieldType: FieldType.password,
                              hintTitle: 'Password',
                              controller: passwordController,
                              validate:
                                  forgetPasswordController.validatePassword),
                          TextFieldWidget(
                              fieldType: FieldType.password,
                              hintTitle: 'Comfirm Password',
                              controller: confirmPasswordController,
                              validate: (String? value) {
                                return forgetPasswordController
                                    .validateConfirmPassword(
                                        passwordController.text, value);
                              }),
                        ],
                      )),
                      kSizedBoxVerticalM,
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ButtonWidget(
                            button: ButtonType.mainButton,
                            text: 'Continue',
                            handleClick: () async {
                              if (forgetPasswordController
                                  .newPasswordFormKey.currentState!
                                  .validate()) {
                                final bool success =
                                    await forgetPasswordController
                                        .setNewPassword(
                                            passwordController.text);
                                if (success) {
                                  Alert.showAlert(ForgetSuccessPopup(),
                                      action: () {
                                    Get.offAllNamed<dynamic>(RoutesName.home);
                                  });
                                }
                              }
                            }),
                      ),
                    ])),
          ),
        )
      ]),
    );
  }
}
