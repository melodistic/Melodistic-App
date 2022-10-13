import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/icon.dart';
import 'package:melodistic/config/style.dart';
import 'package:melodistic/controller/auth.controller.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/type/drawer.type.dart';

class MelodisticDrawer extends StatelessWidget {
  MelodisticDrawer({Key? key}) : super(key: key);

  final AuthController authController = Get.find();
  final List<DrawerItem> _drawerItems = <DrawerItem>[
    DrawerItem('Home', MelodisticIcon.home_door, RoutesName.home),
    DrawerItem('Upload', MelodisticIcon.folder_add, RoutesName.upload),
    DrawerItem('My library', MelodisticIcon.list_add, RoutesName.library),
    DrawerItem('My favorite', MelodisticIcon.favorite, RoutesName.favorite),
    DrawerItem('Setting', MelodisticIcon.settings, RoutesName.setting)
  ];

  Widget renderUserData() {
    return Padding(
      padding: const EdgeInsets.all(kSizeS * 1.5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Obx(() => CircleAvatar(
                  backgroundImage:
                      NetworkImage(authController.userInfo.value!.profileImage),
                  radius: kSizeM + kSizeXS,
                )),
            kSizedBoxVerticalS,
            Obx(() => Text(
                  authController.userInfo.value!.email,
                  style: kHeading2,
                ))
          ]),
    );
  }

  Widget renderDrawerItem(BuildContext context,
      {required String title,
      required IconData icon,
      String? routesName,
      VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: kGrayScaleColor600,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: kSizeS * 1.5,
      ),
      minLeadingWidth: 24,
      title: Text(title, style: kBody2),
      onTap: () {
        if (onTap != null) {
          onTap();
        } else if (routesName != null) {
          Get.toNamed<dynamic>(routesName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  kSizedBoxVerticalM,
                  renderUserData(),
                  ..._drawerItems
                      .map((DrawerItem item) => renderDrawerItem(context,
                          title: item.title,
                          icon: item.icon,
                          routesName: item.route))
                      .toList()
                ]),
          ),
          renderDrawerItem(context,
              title: 'Log out', icon: MelodisticIcon.exit_left, onTap: () {
            authController.logout();
          }),
          kSizedBoxVerticalM
        ],
      ),
    );
  }
}
