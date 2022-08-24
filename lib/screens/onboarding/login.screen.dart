import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/popup-dialog.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
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
    return Scaffold(
        body: Container(
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
                    height: 400,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: kGrayScaleColor50,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kSizeS),
                          topRight: Radius.circular(kSizeS)),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            kSizeM, kSizeXS, kSizeM, kSizeS),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(top: kSizeXS),
                                      child: Text('Forget the Password?',
                                          style: kBody3.copyWith(
                                              color: kGrayScaleColor500),
                                          textAlign: TextAlign.end)),
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(bottom: kSizeS),
                                child: ButtonWidget(
                                    button: ButtonType.mainButton,
                                    state: ButtonState.normal,
                                    handleClick: () => showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            PopupWidget(
                                                content: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                  Image.asset(
                                                      'assets/images/email.png'),
                                                  const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .only(
                                                                  top: kSizeM),
                                                      child: Text('Email sent!',
                                                          style: kHeading2)),
                                                  const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              36,
                                                              kSizeXS,
                                                              36,
                                                              kSizeM),
                                                      child: Text(
                                                          'You will receive an email with a link to reset your password.',
                                                          style: kBody2)),
                                                  Column(
                                                    children: <Widget>[
                                                      const ButtonWidget(
                                                        button: ButtonType
                                                            .mainButton,
                                                        state:
                                                            ButtonState.normal,
                                                        text: 'Resend',
                                                        width: 246,
                                                        height: 48,
                                                      ),
                                                      ButtonWidget(
                                                        button: ButtonType
                                                            .textButton,
                                                        state:
                                                            ButtonState.disable,
                                                        handleClick:
                                                            _handleSignIn,
                                                        text: 'Change email',
                                                        width: 246,
                                                        height: 48,
                                                      )
                                                    ],
                                                  )
                                                ]))),
                                    height: 48,
                                    width: double.infinity,
                                    text: 'Log in')),
                            ButtonWidget(
                                button: ButtonType.softButton,
                                state: ButtonState.normal,
                                height: 48,
                                width: double.infinity,
                                handleClick: _handleSignIn,
                                prefixIcon: MelodisticIcon.google,
                                text: ' Log in with Google'),
                            SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Don\'t have any account?',
                                          style: kBody3.copyWith(
                                              color: kGrayScaleColor500)),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushNamed(RoutesName.register);
                                          },
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  kGrayScaleColor50),
                                          child: Text(' Register',
                                              style: kBody3SemiBold.copyWith(
                                                  color: kSecondaryColor)))
                                    ])),
                          ],
                        ))),
              ],
            )));
  }
}
