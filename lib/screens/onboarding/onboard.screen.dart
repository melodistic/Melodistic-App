// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/screens/onboarding/login.screen.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      isOnbording: true,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kSizeM, vertical: 10),
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enjoy Exercise",
                style: TextStyle(
                fontWeight: kFontWeightBold, fontSize: kFontSizeXL),),
              kSizedBoxHorizontalXXL,
              Row(
                children: [
                  Text("With",
                    style: TextStyle(
                    fontWeight: kFontWeightBold, fontSize: kFontSizeXL),),
                  Text(" Melodistic",
                    style: TextStyle(
                    fontWeight: kFontWeightBold, fontSize: kFontSizeXL, color: kSecondaryColor),),
                ],
              ),
              kSizedBoxHorizontalXXL,
              Container (
                padding: EdgeInsets.symmetric(vertical: kSizeS),
                child: Image.asset('assets/images/onbording.png')
              ),
              Text("This application will match your mood and favorite music for a exercise music track.",
                style: TextStyle(
                fontWeight: kFontWeightRegular, fontSize: kFontSizeM, color: kGrayScaleColor500 ),
                textAlign: TextAlign.center,),
              Container(
                padding: EdgeInsets.symmetric(vertical: kSizeM),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      primary: kGrayScaleColor50,
                    ),
                    onPressed: () { 
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                     },
                    child: Text('Try now'),
                  ),
                ),
              )
              
              
            ],
          )
          
          
      )
    );
  }
}