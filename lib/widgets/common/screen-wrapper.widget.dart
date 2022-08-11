// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/routes.dart';
import 'package:melodistic/widgets/common/type/screen-type.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper(
      {Key? key,
      required this.child,
      this.screen = ScreenType.NoTitle,
      this.customAppbar,
      this.floatingActionButton,
      this.extendBodyBehindAppBar = false})
      : super(key: key);
  final Widget child;
  final ScreenType screen;
  final FloatingActionButton? floatingActionButton;
  final PreferredSizeWidget? customAppbar;
  final bool extendBodyBehindAppBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar ??
            (screen == ScreenType.WithTitle
                ? AppBar(
                    title: Text(
                      "Melodistic",
                      style: TextStyle(color: Colors.black),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.white)
                : AppBar(
                    leading: Padding(
                        padding: EdgeInsets.symmetric(horizontal: kSizeS),
                        child: screen == ScreenType.NoTitle
                            ? null
                            : Row(children: [
                                BackButton(color: Colors.black),
                                Text(
                                  "Back",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: kFontSizeS),
                                )
                              ])),
                    leadingWidth: double.infinity,
                    elevation: 0,
                    backgroundColor: Colors.white,
                  )),
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        body: extendBodyBehindAppBar ? child : SafeArea(child: child),
        floatingActionButton: floatingActionButton);
  }
}
