import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final AuthController _authController = Get.find();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        extendBodyBehindAppBar: true,
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.contain,
                image: AssetImage('assets/images/login.png'),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    height: 455,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: kGrayScaleColorWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kSizeS),
                          topRight: Radius.circular(kSizeS)),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            kSizeM, kSizeXS, kSizeM, kSizeS),
                        child: Form(
                            key: _authController.loginFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
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
                                        validate:
                                            _authController.validatePassword,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: kSizeXS),
                                        child: ButtonWidget(
                                          size: ButtonSize.small,
                                          button: ButtonType.textButton,
                                          customContent: Text(
                                              'Forget the Password?',
                                              style: kBody3.copyWith(
                                                  color: kGrayScaleColor600)),
                                          handleClick: () {
                                            Get.toNamed<dynamic>(
                                                RoutesName.forgetPassword);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: kSizeS),
                                    child: ButtonWidget(
                                        size: ButtonSize.large,
                                        button: ButtonType.mainButton,
                                        state: ButtonState.normal,
                                        handleClick: () async {
                                          if (_authController
                                              .loginFormKey.currentState!
                                              .validate()) {
                                            String email =
                                                _emailController.text;
                                            String password =
                                                _passwordController.text;
                                            bool result = await _authController
                                                .login(email, password);
                                            if (result) {
                                              Get.toNamed<dynamic>(
                                                  RoutesName.home);
                                            }
                                          }
                                        },
                                        text: 'Log in')),
                                ButtonWidget(
                                    size: ButtonSize.large,
                                    button: ButtonType.softButton,
                                    state: ButtonState.normal,
                                    handleClick: _authController.authWithGoogle,
                                    prefixIcon: MelodisticIcon.google,
                                    text: ' Log in with Google'),
                                kSizedBoxVerticalXS,
                                SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Don\'t have any account?',
                                              style: kBody3.copyWith(
                                                  color: kGrayScaleColor500)),
                                          kSizedBoxHorizontalXXS,
                                          GestureDetector(
                                              onTap: () {
                                                Get.toNamed<dynamic>(
                                                    RoutesName.register);
                                              },
                                              child: Text('Register',
                                                  style:
                                                      kBody3SemiBold.copyWith(
                                                          color:
                                                              kSecondaryColor)))
                                        ])),
                              ],
                            )))),
              ],
            )));
  }
}
