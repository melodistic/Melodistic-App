import 'package:flutter/material.dart';

class BottomSheetAction {
  final String title;
  final IconData icon;
  final VoidCallback handleClick;

  BottomSheetAction(
      {required this.title, required this.icon, required this.handleClick});
}

enum BottomSheetSize { large, small }
