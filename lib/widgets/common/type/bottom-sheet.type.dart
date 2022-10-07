import 'package:flutter/material.dart';

class BottomSheetAction {
  final String title;
  final IconData icon;
  final VoidCallback handleClick;

  BottomSheetAction(this.title, this.icon, this.handleClick);
}
