import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/screen-type.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  Future<void> _handleSignIn() async {
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        account.authentication.then((value) => {print(value.accessToken)});
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        screen: ScreenType.NoTitle,
        child: Column(
          children: [
            Text("Login Screen"),
            TextButton(
                onPressed: _handleSignIn, child: Text("Sign in with Google"))
          ],
        ));
  }
}
