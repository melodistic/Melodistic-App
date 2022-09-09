import 'package:flutter/material.dart';
import 'package:melodistic/app.dart';
import 'package:melodistic/controller/setup.dart';

void main() {
  Controller.setup();
  runApp(const MelodisticApp());
}
