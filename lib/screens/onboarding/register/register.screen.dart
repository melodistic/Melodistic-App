import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/field.type.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController gmailController = TextEditingController();
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
            TextFieldWidget(controller: gmailController, hintTitle: 'Gmail', fieldType: FieldType.text),
            TextFieldWidget(controller: passwordController, hintTitle: 'Password', fieldType: FieldType.password),
            TextFieldWidget(controller: passwordController, hintTitle: 'Confirm Password', fieldType: FieldType.password),
            Padding(
              padding: const EdgeInsets.only(top: 150, bottom: kSizeXS),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      primary: kGrayScaleColor50),
                  onPressed: () {},
                  child: const Text('Create an account')))),
            SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: kGrayScaleColor100,
                        primary: kPrimaryColor),
                    onPressed: _handleSignIn,
                    child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: const <Widget>[
                          Image(
                              image: AssetImage(
                                  'assets/images/google.png')),
                          Text('   Register with Google')
                        ]))),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Already have an account?',
                        style: kBody3.copyWith(
                            color: kGrayScaleColor500)),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RoutesName.login);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor:
                                kGrayScaleColor50),
                        child: Text('Login',
                            style: kBody3SemiBold.copyWith(
                                color: kSecondaryColor)))
                  ])),
          ])));
  }
}
