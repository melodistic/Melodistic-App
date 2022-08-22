import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

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
        screen: ScreenType.noTitle,
        child: Column(
          children: <Widget>[
            const Text('Login Screen'),
            TextButton(
                onPressed: _handleSignIn,
                child: const Text('Sign in with Google')),
          ],
        ));
  }
}
