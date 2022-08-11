import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        screen: ScreenType.noTitle,
        child: Container(
            key: const Key('onboarding-container'),
            padding:
                const EdgeInsets.symmetric(horizontal: kSizeM, vertical: 10),
            child: Column(
              key: const Key('onboarding-column'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Enjoy Exercise', style: kHeading1),
                kSizedBoxHorizontalXXL,
                Row(
                  children: <Widget>[
                    const Text('With', style: kHeading1),
                    Text(' Melodistic',
                        style: kHeading1.copyWith(color: kSecondaryColor))
                  ],
                ),
                kSizedBoxHorizontalXXL,
                Container(
                    padding: const EdgeInsets.symmetric(vertical: kSizeS),
                    child: Image.asset('assets/images/onbording.png')),
                Text(
                    'This application will match your mood and favorite music for a exercise music track.',
                    textAlign: TextAlign.center,
                    style: kBody2.copyWith(color: kGrayScaleColor500)),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: kSizeM),
                  child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              primary: kGrayScaleColor50),
                          onPressed: () {
                            Navigator.of(context).pushNamed(RoutesName.login);
                          },
                          child: const Text('Try now'))),
                )
              ],
            )));
  }
}
