import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/widgets/common/type/screen.type.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper(
      {Key? key,
      required this.child,
      this.screen = ScreenType.noTitle,
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
            (screen == ScreenType.withTitle
                ? AppBar(
                    title: const Text(
                      'Melodistic',
                      style: TextStyle(color: Colors.black),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.white)
                : AppBar(
                    leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kSizeS),
                        child: screen == ScreenType.noTitle
                            ? null
                            : Row(children: const <Widget>[
                                BackButton(color: Colors.black),
                                Text(
                                  'Back',
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
