import 'package:flutter/material.dart';
import 'package:melodistic/config/color.dart';
import 'package:melodistic/widgets/common/drawer.widget.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper(
      {Key? key,
      required this.child,
      this.customAppbar,
      this.floatingActionButton,
      this.extendBodyBehindAppBar = false})
      : super(key: key);
  final Widget child;
  final FloatingActionButton? floatingActionButton;
  final PreferredSizeWidget? customAppbar;
  final bool extendBodyBehindAppBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar,
      backgroundColor: kGrayScaleColorWhite,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: extendBodyBehindAppBar ? child : SafeArea(child: child),
      floatingActionButton: floatingActionButton,
      drawer: MelodisticDrawer(),
    );
  }
}
