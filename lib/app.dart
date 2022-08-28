import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:melodistic/routes.dart';

class MelodisticApp extends StatefulWidget {
  const MelodisticApp({Key? key}) : super(key: key);

  @override
  State<MelodisticApp> createState() => _MelodisticAppState();
}

class _MelodisticAppState extends State<MelodisticApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Melodistic App',
      initialRoute: RoutesName.onboard,
      routes: routes,
    );
  }
}
