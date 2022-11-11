import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/auth.controller.dart';
import 'package:melodistic/controller/user.controller.dart';
import 'package:melodistic/screens/setting/widget/setting-success-popup.widget.dart';
import 'package:melodistic/screens/setting/widget/unverified-box.widget.dart';
import 'package:melodistic/singleton/alert.dart';
import 'package:melodistic/utils/file.dart';
import 'package:melodistic/widgets/common/appbar/back.widget.dart';
import 'package:melodistic/widgets/common/button.widget.dart';
import 'package:melodistic/widgets/common/screen-wrapper.widget.dart';

class SettingProfileScreen extends StatelessWidget {
  SettingProfileScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.find();
  final UserController userController = Get.find();

  ImageProvider? getDisplayImage() {
    if (userController.profileImage.value != null) {
      return FileImage(userController.profileImage.value!);
    } else if (authController.userInfo.value != null) {
      return NetworkImage(authController.userInfo.value!.profileImage);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        customAppbar: const BackAppbar(title: 'Profile Setting'),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSizeM),
          child: Column(children: <Widget>[
            Expanded(
                child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Obx(() => CircleAvatar(
                            backgroundImage: getDisplayImage(),
                            radius: kSizeM * 1.5,
                          )),
                      Container(
                          padding: const EdgeInsets.all(kSizeXXXS),
                          decoration: const BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: kBorderRadiusS),
                          child: const Icon(
                            MelodisticIcon.pen,
                            color: kGrayScaleColorWhite,
                            size: kSizeS * 1.5,
                          )),
                    ],
                  ),
                  onTap: () async {
                    File? image = await getPhotoFromGallery();
                    if (image != null) {
                      userController.setProfileImage(image);
                    }
                  },
                ),
                if (!authController
                    .userInfo.value!.isEmailVerified) ...<Widget>[
                  kSizedBoxVerticalS,
                  UnverifiedBox()
                ],
                kSizedBoxVerticalS,
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Email',
                          style:
                              kBody3Medium.copyWith(color: kGrayScaleColor500),
                        ),
                        Obx(() => Text(
                              authController.userInfo.value!.email,
                              style: kBody2,
                            )),
                      ],
                    )
                  ],
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ButtonWidget(
                text: 'Save',
                handleClick: () async {
                  try {
                    bool success = await userController.updateProfileImage();
                    if (success) {
                      Alert.showAlert(const SettingSuccessPopup(
                        title: 'Account Setting Updated',
                        description: 'Your information has been changed',
                      ));
                      authController.fetchUserProfile();
                    }
                  } catch (_) {}
                },
              ),
            ),
          ]),
        ));
  }
}
