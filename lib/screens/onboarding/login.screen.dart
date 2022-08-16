// ignore_for_file: prefer_const_constructors, always_specify_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final userController = TextEditingController();
  final passwordController = TextEditingController();
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
  Widget loginInput(TextEditingController userInput, String hintTitle, TextInputType keyboardType) {
    return TextFormField(
      controller: userInput,
      decoration: InputDecoration(
        hintText: hintTitle,
        labelText: hintTitle,
        fillColor: kSecondaryColor900
      ),
      keyboardType: keyboardType,
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (String? value) {
        return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            fit: BoxFit.contain,
            image: AssetImage('assets/images/login.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 430,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kGrayScaleColor50,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kSizeS),
                  topRight: const Radius.circular(kSizeS)),
              ),
              child: Padding(
                padding: EdgeInsets.all(kSizeM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    loginInput(userController, 'username', TextInputType.text),
                    loginInput(passwordController, 'password', TextInputType.visiblePassword),
                    Padding(
                      padding: EdgeInsets.only(top: kSizeS, bottom: kSizeM),
                      child: Text('Forget the Password?',
                        style: kBody3.copyWith(color: kGrayScaleColor500),
                        textAlign: TextAlign.end)
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: kSizeS) ,
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                primary: kGrayScaleColor50),
                            onPressed: () {},
                            child: const Text('Log in')))),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: 
                          TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: kGrayScaleColor100,
                              primary: kPrimaryColor),
                          onPressed: _handleSignIn,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage('assets/images/google.png')),
                              Text('   Log in with Google')
                            ]))
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Row( 
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have any account?', 
                            style: kBody3.copyWith(color: kGrayScaleColor500)),
                          TextButton(
                            onPressed: () {
                            Navigator.of(context).pushNamed(RoutesName.register);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: kGrayScaleColor50),
                            child: Text(' Register',
                              style: kBody3SemiBold.copyWith(color: kSecondaryColor))) 
                        ])
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: kGrayScaleColor50,
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: const Radius.circular(kSizeS),
                    //       topRight: const Radius.circular(kSizeS)
                    //     )
                    //   ),
                    //   child: TextButton(
                    //     onPressed: _handleSignIn,
                    //     child: const Text('Sign in with Google')),
                    // ),
                  ],
                ))
              ),
          ],
        ))
    );
  }
}
