import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/auth.controller.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final AuthController _authController = Get.find();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        screen: MelodisticScreenType.withBack,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeM),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Create Your', style: kHeading1),
                  const Text('Account', style: kHeading1),
                  Expanded(
                      child: Form(
                    key: _authController.signupFormKey,
                    child: Column(
                      children: <Widget>[
                        TextFieldWidget(
                          controller: _emailController,
                          hintTitle: 'Email',
                          fieldType: FieldType.text,
                          validate: _authController.validateEmail,
                        ),
                        TextFieldWidget(
                          controller: _passwordController,
                          hintTitle: 'Password',
                          fieldType: FieldType.password,
                          validate: _authController.validatePassword,
                        ),
                        TextFieldWidget(
                          controller: _confirmPasswordController,
                          hintTitle: 'Confirm Password',
                          fieldType: FieldType.password,
                          validate: (String? value) =>
                              _authController.validateConfirmPassword(
                                  value, _passwordController.text),
                        ),
                      ],
                    ),
                  )),
                  Padding(
                      padding: const EdgeInsets.only(bottom: kSizeXS),
                      child: ButtonWidget(
                          size: ButtonSize.large,
                          button: ButtonType.mainButton,
                          state: ButtonState.normal,
                          handleClick: () async {
                            if (_authController.signupFormKey.currentState!
                                .validate()) {
                              String email = _emailController.text;
                              String password = _passwordController.text;
                              bool result =
                                  await _authController.signup(email, password);
                              if (result) {
                                Get.toNamed<dynamic>(RoutesName.registerTime);
                              }
                            }
                          },
                          text: 'Create an account')),
                  ButtonWidget(
                      button: ButtonType.softButton,
                      state: ButtonState.normal,
                      size: ButtonSize.large,
                      handleClick: _authController.authWithGoogle,
                      text: ' Register with Google',
                      prefixIcon: MelodisticIcon.google),
                  kSizedBoxVerticalXS,
                  SizedBox(
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Already have an account?',
                                style:
                                    kBody3.copyWith(color: kGrayScaleColor500)),
                            kSizedBoxHorizontalXXS,
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed<dynamic>(RoutesName.login);
                                },
                                child: Text('Login',
                                    style: kBody3SemiBold.copyWith(
                                        color: kSecondaryColor)))
                          ])),
                ])));
  }
}
