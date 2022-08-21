import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/config/system-uicons.dart';
import 'package:melodistic/routes.dart';
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
            (screen == ScreenType.noAppbar
                ? null
                : (screen == ScreenType.withTitle
                    ? AppBar(
                        key: const Key('melodistic-appbar'),
                        title: const Text(
                          'Melodistic',
                          style: TextStyle(color: Colors.black),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.white)
                    : AppBar(
                        key: const Key('melodistic-appbar'),
                        leading: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: kSizeS),
                            child: SizedBox(
                              child: screen == ScreenType.noTitle
                                ? null
                                : TextButton(
                                  onPressed: () {
                                            Navigator.of(context)
                                                .pushNamed(RoutesName.login);
                                          },
                                    child: Row(children: const <Widget>[
                                      Icon(SystemUicons.chevron_left, color: kPrimaryColor,),
                                      Text(
                                        'Back',
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: kFontSizeM),
                                      )
                                    ])))),
                        leadingWidth: double.infinity,
                        elevation: 0,
                        backgroundColor: Colors.white,
                      ))),
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        body: extendBodyBehindAppBar ? child : SafeArea(child: child),
        floatingActionButton: floatingActionButton);
  }
}
