import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/widgets/common/appbar/alternative.widget.dart';
import 'package:melodistic/widgets/common/appbar/home.widget.dart';
import 'package:melodistic/widgets/common/drawer.widget.dart';
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
                  ? const HomeAppbar()
                  : AlternativeAppbar(screen: screen)) as PreferredSizeWidget),
      backgroundColor: kGrayScaleColorWhite,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: extendBodyBehindAppBar ? child : SafeArea(child: child),
      floatingActionButton: floatingActionButton,
      drawer: MelodisticDrawer(),
    );
  }
}
