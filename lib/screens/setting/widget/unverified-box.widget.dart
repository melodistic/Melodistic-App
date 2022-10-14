import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/auth.controller.dart';
import 'package:melodistic/screens/setting/widget/setting-success-popup.widget.dart';
import 'package:melodistic/singleton/alert.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class UnverifiedBox extends StatelessWidget {
  UnverifiedBox({Key? key}) : super(key: key);
  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSizeS),
      decoration: const BoxDecoration(
          borderRadius: kBorderRadiusXXS, color: kGrayScaleColor100),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: kSizeM * 1.5,
          height: kSizeM * 1.5,
          child: Image.asset(
            'assets/images/warning.png',
            fit: BoxFit.contain,
          ),
        ),
        kSizedBoxHorizontalS,
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Account Not Verified',
              style: kBody1Medium,
            ),
            Text(
              'Your account has not yet verified',
              style: kBody3.copyWith(color: kGrayScaleColorBlack),
            ),
            ButtonWidget(
              size: ButtonSize.small,
              button: ButtonType.outlineButton,
              customContent: Text(
                'Resent verification email',
                style: kBody3Medium.copyWith(color: kGrayScaleColorBlack),
              ),
              handleClick: () async {
                try {
                  bool success = await authController.resentEmailVerification();
                  if (success) {
                    Alert.showAlert(const SettingSuccessPopup(
                        title: 'Resend Verification Email',
                        description:
                            'Your verification email has been sent to your email address'));
                  }
                } catch (_) {}
              },
            ),
          ],
        ))
      ]),
    );
  }
}
