import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/forget-password.controller.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/appbar/back.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/textfield.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class ValidateOtpScreen extends StatelessWidget {
  ValidateOtpScreen({Key? key}) : super(key: key);
  final TextEditingController otpController = TextEditingController();
  final ForgetPasswordController forgetPasswordController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      customAppbar: const BackAppbar(
        title: 'Validate OTP',
      ),
      child: Padding(
        padding:
            const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeS * 1.5, kSizeXXXS),
        child: Form(
            key: forgetPasswordController.otpValidateFormKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/forget_pwd.png'),
                  kSizedBoxVerticalL,
                  Padding(
                      padding: const EdgeInsets.only(right: kSizeM),
                      child: Obx(() => Text(
                            'A One Time Passcode has been sent to ${forgetPasswordController.email.value}',
                            style: kBody2,
                          ))),
                  kSizedBoxVerticalS,
                  const Text(
                    'Please check your e-mail and enter the OTP below to verify your email address. If you cannot see the email, make sure to check your SPAM folder.',
                    style: kBody2,
                  ),
                  TextFieldWidget(
                      hintTitle: 'OTP',
                      controller: otpController,
                      validate: forgetPasswordController.validateOTP),
                  kSizedBoxVerticalL,
                  ButtonWidget(
                    button: ButtonType.mainButton,
                    text: 'Verify',
                    handleClick: () async {
                      if (forgetPasswordController
                          .otpValidateFormKey.currentState!
                          .validate()) {
                        bool success = await forgetPasswordController
                            .verifyOTP(otpController.text);
                        if (success) {
                          Get.toNamed<void>(RoutesName.newPassword);
                        }
                      }
                    },
                  )
                ])),
      ),
    );
  }
}
