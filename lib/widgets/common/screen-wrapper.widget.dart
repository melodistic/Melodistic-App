import 'package:flutter/material.dart';
import 'package:melodistic/config/constant.dart';
import 'package:melodistic/routes.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper(
      {Key? key,
      required this.child,
      this.isHome = false,
      this.customAppbar,
      this.extendBodyBehindAppBar = false})
      : super(key: key);
  final Widget child;
  final bool isHome;
  final PreferredSizeWidget? customAppbar;
  final bool extendBodyBehindAppBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar ??
          (isHome
              ? AppBar(
                  title: Text(
                    "Melodistic",
                    style: TextStyle(color: Colors.black),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white,
                )
              : AppBar(
                  leading: Padding(
                      padding: EdgeInsets.symmetric(horizontal: kSizeS),
                      child: Row(children: [
                        BackButton(
                          color: Colors.black,
                        ),
                        Text(
                          "Back",
                          style: TextStyle(
                              color: Colors.black, fontSize: kFontSizeS),
                        )
                      ])),
                  leadingWidth: double.infinity,
                  elevation: 0,
                  backgroundColor: Colors.white,
                )),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: extendBodyBehindAppBar ? child : SafeArea(child: child),
      floatingActionButton: isHome
          ? FloatingActionButton(
              child: Icon(
                Icons.add,
              ),
              backgroundColor: Colors.black,
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesName.customize);
              },
            )
          : null,
    );
  }
}
