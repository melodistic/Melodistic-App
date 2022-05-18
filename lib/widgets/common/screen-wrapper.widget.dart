import 'package:flutter/material.dart';
import 'package:melodistic/routes.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({Key? key, required this.child, this.isHome = false})
      : super(key: key);
  final Widget child;
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: !isHome
            ? BackButton(
                color: Colors.black,
              )
            : null,
        title: Text(
          "Melodistic",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(child: child),
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
