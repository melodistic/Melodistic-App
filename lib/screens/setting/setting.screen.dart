import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/auth.controller.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/screens/setting/widget/setting-tab.widget.dart';
import 'package:melodistic/widgets/common/appbar/main.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';
import 'package:melodistic/widgets/common/type/button.type.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      customAppbar: const MainAppbar(title: 'Setting'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSizeXS),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SettingTabWidget(
                  title: 'Profile setting',
                  handleClick: () {
                    Get.toNamed<dynamic>(RoutesName.settingProfile);
                  }),
              SettingTabWidget(
                  title: 'Change password',
                  handleClick: () {
                    Get.toNamed<dynamic>(RoutesName.settingPassword);
                  }),
              ListTile(
                onTap: () {
                  authController.logout();
                },
                title:
                    Text('Log out', style: kBody2.copyWith(color: kErrorColor)),
              ),
            ]),
      ),
    );
  }
}
