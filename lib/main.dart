import 'package:flutter/material.dart';
import 'package:melodistic/app.dart';
import 'package:melodistic/singleton/controller.dart';

void main() {
  Controller.setup();
  runApp(const MelodisticApp());
}
