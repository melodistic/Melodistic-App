import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/auth.controller.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/screens/customize-track/widgets/customtime-picker.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class RegisterTimeScreen extends StatelessWidget {
  RegisterTimeScreen({Key? key}) : super(key: key);

  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kSizeM, kSizeXL, kSizeM, kSizeXS),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSizeS),
            child: Text(
                'Choose the music track for you based on the amount of time you spend exercising.',
                style: kBody2.copyWith(color: kGrayScaleColor600)),
          ),
          kSizedBoxM,
          Container(
              padding:
                  const EdgeInsets.fromLTRB(kSizeM, kSizeS, kSizeM, kSizeM),
              color: kGrayScaleColor200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                      padding:
                          const EdgeInsets.only(bottom: kSizeS, top: kSizeS),
                      child: Text(
                        'Exercise Duration',
                        style: kHeading2.copyWith(color: kPrimaryColor),
                      )),
                  Obx(() => CustomTimePicker(
                        onChanged: authController.setDuration,
                        duration: authController.duration.value,
                      ))
                ],
              )),
          kSizedBoxXXL,
          ButtonWidget(
            button: ButtonType.mainButton,
            text: 'Done',
            handleClick: () async {
              try {
                bool success = await authController.configDuration();
                if (success) {
                  Get.toNamed<dynamic>(RoutesName.home);
                }
              } catch (_) {}
            },
          ),
          const ButtonWidget(button: ButtonType.textButton, text: 'Not now')
        ]),
      ),
    );
  }
}
