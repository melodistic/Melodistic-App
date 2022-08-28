import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['email']);
  Future<void> _handleSignIn() async {
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        account.authentication
            .then((GoogleSignInAuthentication value) => value.accessToken);
      }
    } catch (error) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        screen: ScreenType.withBack,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeM),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Create Your', style: kHeading1),
                  const Text('Account', style: kHeading1),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        TextFieldWidget(
                          controller: emailController,
                          hintTitle: 'Email',
                          fieldType: FieldType.text,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                        ),
                        TextFieldWidget(
                          controller: passwordController,
                          hintTitle: 'Password',
                          fieldType: FieldType.password,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                        ),
                        TextFieldWidget(
                          controller: passwordController,
                          hintTitle: 'Confirm Password',
                          fieldType: FieldType.password,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Confirm Password is required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: kSizeXS),
                      child: ButtonWidget(
                          size: ButtonSize.large,
                          button: ButtonType.mainButton,
                          state: ButtonState.normal,
                          handleClick: () {
                            Navigator.of(context)
                                .pushNamed(RoutesName.registerTime);
                          },
                          text: 'Create an account')),
                  ButtonWidget(
                      button: ButtonType.softButton,
                      state: ButtonState.normal,
                      size: ButtonSize.large,
                      handleClick: _handleSignIn,
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
                                  Navigator.of(context)
                                      .pushNamed(RoutesName.login);
                                },
                                child: Text('Login',
                                    style: kBody3SemiBold.copyWith(
                                        color: kSecondaryColor)))
                          ])),
                ])));
  }
}
